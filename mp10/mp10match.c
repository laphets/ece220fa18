/**
 * The source file for my implementation of the handle_request function.
 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "mp5.h"
#include "mp10.h"


//
// These variables hold the heads of two singly-linked lists of 
// requests.  
//
// The avaialble list consists of unpaired requests: partner 
// should be NULL, and next is used to form the list.   
// 
// The shared list consists of groups with non-empty start and end 
// vertex intersections.  Only one of the requests in the group is in 
// the list.  The others are linked through the first's partner field 
// and then through the next field of the others in the group.  The 
// next field of the first request in a group is used to form the
// shared list.
//
// Note: for MP2, you should only build groups of two in the shared
// list.
//

static request_t* available = NULL;
static request_t* shared = NULL;


/**
 * This function processes a single request, allocating structures as necessary,
 * then comparing it with all unpaired requests handled previously.
 * If a match is found, the function moves the new request and the matching request into a separate list.
 * @param g graph
 * @param p tree
 * @param h heap
 * @param r request
 * @return 1 on success, 0 on fail
 */
int32_t
handle_request (graph_t* g, pyr_tree_t* p, heap_t* h, request_t* r)
{
    // Allocate data needed
    vertex_set_t* src_vs = new_vertex_set();
    if(src_vs == NULL) {
        return 0;
    }
    vertex_set_t* dst_vs = new_vertex_set();
    if(dst_vs == NULL) {
        free_vertex_set(src_vs);
        return 0;
    }

    path_t* path = new_path();
    if(path == NULL) {
        free_vertex_set(src_vs);
        free_vertex_set(dst_vs);
        return 0;
    }

    find_nodes(&r->from, src_vs, p, 0);
    find_nodes(&r->to, dst_vs, p, 0);

    if(src_vs->count == 0 || dst_vs->count == 0) {
        free_vertex_set(src_vs);
        free_vertex_set(dst_vs);
        free_path(path);
        return 0;
    }

//    mark_vertex_minimap(g, p);

    build_vertex_set_minimap(g, src_vs);
    build_vertex_set_minimap(g, dst_vs);

    // TODO: Free this
    vertex_set_t* tmpSrc = new_vertex_set();
    if(tmpSrc == NULL) {
        free_vertex_set(src_vs);
        free_vertex_set(dst_vs);
        free_path(path);
        return 0;
    }
    tmpSrc->id_array_size = src_vs->count > dst_vs->count ? src_vs->count : dst_vs->count;
    tmpSrc->id = calloc((size_t) tmpSrc->id_array_size, sizeof(*tmpSrc->id));
    if(tmpSrc->id == NULL) {
        free_vertex_set(src_vs);
        free_vertex_set(dst_vs);
        free_path(path);
        free_vertex_set(tmpSrc);
        return 0;
    }

    vertex_set_t* tmpDst = new_vertex_set();
    if(tmpDst == NULL) {
        free_vertex_set(src_vs);
        free_vertex_set(dst_vs);
        free_path(path);
        free_vertex_set(tmpSrc);
        return 0;
    }
    tmpDst->id_array_size = src_vs->count > dst_vs->count ? src_vs->count : dst_vs->count;
    tmpDst->id = calloc((size_t) tmpDst->id_array_size, sizeof(*tmpDst->id));
    if(tmpDst->id == NULL) {
        free_vertex_set(src_vs);
        free_vertex_set(dst_vs);
        free_path(path);
        free_vertex_set(tmpSrc);
        free_vertex_set(tmpDst);
        return 0;
    }


    for(request_t** it = &available; *it != NULL; it = &(*it)->next) {
        // If they have union(overlap)
        if(((*it)->src_vs->minimap&src_vs->minimap) && ((*it)->dst_vs->minimap&dst_vs->minimap)) {
            tmpSrc->count = 0;
            tmpSrc->minimap = ((*it)->src_vs->minimap&src_vs->minimap);
            merge_vertex_sets((*it)->src_vs, src_vs, tmpSrc);

//            printf("\n");
//            for(int32_t i = 0; i < (*it)->src_vs->count; i++)
//                printf("%d ", (*it)->src_vs->id[i]);
//            printf("\n");
//            for(int32_t i = 0; i < src_vs->count; i++)
//                printf("%d ", src_vs->id[i]);
//            printf("\n");
//            for(int32_t i = 0; i < tmpSrc->count; i++)
//                printf("%d ", tmpSrc->id[i]);
//            printf("\n");
//            printf("\n");


            tmpDst->count = 0;
            tmpDst->minimap = ((*it)->dst_vs->minimap&dst_vs->minimap);
            merge_vertex_sets((*it)->dst_vs, dst_vs, tmpDst);

            if(tmpSrc->count == 0 || tmpDst->count == 0) {
                continue;
            }
            if(dijkstra(g, h, tmpSrc, tmpDst, path)) {
                // Matching has found
                request_t* second = (*it);
                request_t* first = r;
                // Remove from available
                (*it) = (*it)->next;
                // r matches (*it)
                first->partner = second;
                second->partner = NULL;
                second->next = NULL;
                // Add to shared
                first->next = shared;
                shared = first;

                build_vertex_set_minimap(g, tmpSrc);
                build_vertex_set_minimap(g, tmpDst);

//                printf("\n");
//
//                for(int32_t i = 0; i < tmpSrc->count; i++) {
//                    printf("%d ", tmpSrc->id[i]);
//                }
//                printf("\n");

                // Set shared info
                first->src_vs = tmpSrc;
                second->src_vs = tmpSrc;
                first->dst_vs = tmpDst;
                second->dst_vs = tmpDst;
                // Build path
                build_path_minimap(g, path);
                // Set path
                first->path = path;
                second->path = path;

                // Then free
                free_vertex_set(src_vs);
                free_vertex_set(dst_vs);

                return 1;
            }
        }
    }

    // No match found, add to the available set
    r->next = available;
    r->partner = NULL;
    r->path = NULL;
    r->src_vs = src_vs;
    r->dst_vs = dst_vs;
    available = r;

    // Then free
//    free(path->id);   // Maynot free, since there is no path
    free_path(path);
    free_vertex_set(tmpSrc);
    free_vertex_set(tmpDst);

    return 1;
}


void
print_results ()
{
    request_t* r;
    request_t* prt;

    printf ("Matched requests:\n");
    for (r = shared; NULL != r; r = r->next) {
        printf ("%5d", r->uid);
	for (prt = r->partner; NULL != prt; prt = prt->next) {
	    printf (" %5d", prt->uid);
	}
	printf (" src=%016llX dst=%016llX path=%016llX\n", r->src_vs->minimap,
		r->dst_vs->minimap, r->path->minimap);
    }

    printf ("\nUnmatched requests:\n");
    for (r = available; NULL != r; r = r->next) {
        printf ("%5d src=%016llX dst=%016llX\n", r->uid, r->src_vs->minimap,
		r->dst_vs->minimap);
    }
}


int32_t
show_results_for (graph_t* g, int32_t which)
{
    request_t* r;
    request_t* prt;

    // Can only illustrate one partner.
    for (r = shared; NULL != r; r = r->next) {
	if (which == r->uid) {
	    return show_find_results (g, r, r->partner);
	}
	for (prt = r->partner; NULL != prt; prt = prt->next) {
	    if (which == prt->uid) {
		return show_find_results (g, prt, r);
	    }
	}
    }

    for (r = available; NULL != r; r = r->next) {
        if (which == r->uid) {
	    return show_find_results (g, r, r);
	}
    }
    return 0;
}


static void
free_request (request_t* r)
{
    free_vertex_set (r->src_vs);
    free_vertex_set (r->dst_vs);
    if (NULL != r->path) {
	free_path (r->path);
    }
    free (r);
}

void
free_all_data ()
{
    request_t* r;
    request_t* prt;
    request_t* next;

    // All requests in a group share source and destination vertex sets
    // as well as a path, so we need free those elements only once.
    for (r = shared; NULL != r; r = next) {
	for (prt = r->partner; NULL != prt; prt = next) {
	    next = prt->next;
	    free (prt);
	}
	next = r->next;
	free_request (r);
    }

    for (r = available; NULL != r; r = next) {
	next = r->next;
	free_request (r);
    }
}


