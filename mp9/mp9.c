#include <stdint.h>
#include <stdio.h>

#include <stdlib.h>

#include "mp5.h"
#include "mp9.h"

#define MY_INFINITY   1000000000


/***
 * starting at array index nnum of a pyramid tree, find vertices within range
 * of a locale and write their ids into a vertex set
 * @param loc the location specification
 * @param vs the vetex set
 * @param p the pyr tree
 * @param nnum the cur index of the pyr tree
 */
void
find_nodes (locale_t* loc, vertex_set_t* vs, pyr_tree_t* p, int32_t nnum)
{
    // Do not modify the following line nor add anything above in the function.
    record_fn_call ();

    // Check for overflow
    if(nnum >= p->n_nodes) {
        return;
    }
    
    // First get the current node
    pyr_node_t* curNode = &(p->node[nnum]);


    // We can check whether it's a leaf node
    if(nnum*4+1 >= p->n_nodes) {
        // It's leaf
        // Then check whether it's in range
        if(in_range(loc, curNode->x, curNode->y_left)) {
            // Try to add it into the set
            // Check for the range TODO: It may can overflow
            if(vs->count >= MAX_IN_VERTEX_SET) {
                return;
            }
            vs->id[vs->count++] = curNode->id;
        }
        return;
    }

    // If it's not leaf, then, try to find valid in range node
    // First, we can get the four boundings
    int32_t xLeft = loc->x - loc->range;
    int32_t xRight = loc->x + loc->range;
    int32_t yUp = loc->y - loc->range;
    int32_t yDown = loc->y + loc->range;

    // Then, checking for four regions
    if(xLeft <= curNode->x) {
        if(yUp <= curNode->y_left) {
            find_nodes(loc, vs, p, nnum*4+1);
        }
        if(yDown >= curNode->y_left) {
            find_nodes(loc, vs, p, nnum*4+3);
        }
    }
    if(xRight >= curNode->x) {
        if(yUp <= curNode->y_right) {
            find_nodes(loc, vs, p, nnum*4+2);
        }
        if(yDown >= curNode->y_right) {
            find_nodes(loc, vs, p, nnum*4+4);
        }
    }
}


/***
 * remove any vertices not in range of a locale from a vertex set
 * @param g the pointer to the graph
 * @param vs the vertex set
 * @param loc the location and range specification
 */
void
trim_nodes (graph_t* g, vertex_set_t* vs, locale_t* loc)
{
    int32_t tmp[MAX_IN_VERTEX_SET], k = 0;
    for(int32_t i = 0; i < vs->count; i++) {
        vertex_t* curVertex = &(g->vertex[vs->id[i]]);
        if(in_range(loc, curVertex->x, curVertex->y)) {
            if(k >= MAX_IN_VERTEX_SET) {
                break;
            }
            tmp[k++] = vs->id[i];
        }
    }

    vs->count = k;
    for(int32_t i = 0; i < k; i ++) {
        vs->id[i] = tmp[i];
    }
}

/***
 * Swap two variable
 * @param a the first variable
 * @param b the second variable
 */
void swap(int32_t* a, int32_t* b) {
    int32_t tmp = *a;
    *a = *b;
    *b = tmp;
}

/***
 * Shift down an element in the heap, to maintain its structure
 * @param g the pointer to graph
 * @param h the pointer to heap
 * @param i current index in the heap array
 */
void shift_down(graph_t *g, heap_t *h, int32_t i) {
    int32_t smallest = i;
    int32_t l = 2 * i + 1;
    int32_t r = 2 * i + 2;

    // Check for left child
    if(l < h->n_elts && g->vertex[h->elt[l]].from_src < g->vertex[h->elt[smallest]].from_src) {
        smallest = l;
    }
    // Check for right child
    if(r < h->n_elts && g->vertex[h->elt[r]].from_src < g->vertex[h->elt[smallest]].from_src) {
        smallest = r;
    }

    if(smallest != i) {
        swap(&h->elt[smallest], &h->elt[i]);
        shift_down(g, h, smallest);
    }
}
/***
 * Shift up an element in the heap, to maintain its structure
 * @param g the pointer to graph
 * @param h the pointer to heap
 * @param i current index in the heap array
 */
void shift_up(graph_t *g, heap_t* h, int32_t i) {
    if(i == 0) {
        return;
    }
    int32_t parent = (i-1)/2;
    // If cur is less than parent, then, exchange
    if(g->vertex[h->elt[i]].from_src < g->vertex[h->elt[parent]].from_src) {
        swap(&h->elt[i], &h->elt[parent]);
        shift_up(g, h, parent);
    }
}
/***
 * Get the top element of the heap
 * @param h the pointer to the heap
 * @return the top element id
 */
int32_t get_top(heap_t* h) {
    if(h->n_elts == 0) {
        return -1;
    }
    return h->elt[0];
}
/***
 * Get the size of the heap
 * @param h the pointer to the heap
 * @return the size of the heap
 */
int32_t get_size(heap_t* h) {
    return h->n_elts;
}
/***
 * Pop the top element from the heap
 * @param g the poniter to the graph
 * @param h the pointer to the heap
 */
void pop(graph_t* g, heap_t* h) {
    // If it's empty, then directly return
    if(h->n_elts == 0) {
        return;
    }
    // Just exchange first element with last, then shift down
    swap(&h->elt[0], &h->elt[h->n_elts-1]);
    h->n_elts--;
    shift_down(g, h, 0);
}
/***
 * Insert an element to the heap
 * @param g the pointer to the graph
 * @param h the pointer to the heap
 * @param id the id of the element
 */
void insert(graph_t* g, heap_t* h, int32_t id) {
    h->elt[h->n_elts++] = id;
    shift_up(g, h, h->n_elts-1);
}


/***
 * find the shortest path between any node in the src vertex set and any
 * node in the destination vertex set, and write that path into path;
 * returns 1 on success, or 0 on failure
 * @param g the pointer to graph
 * @param h the pointer to heap
 * @param src the pointer to src set
 * @param dest the pointer to dest set
 * @param path the pointer to path
 * @return 1 on success, or 0 on failure
 */
int32_t
dijkstra (graph_t* g, heap_t* h, vertex_set_t* src, vertex_set_t* dest,
          path_t* path)
{
    for(int32_t i = 0; i < g->n_vertices; i++) {
        g->vertex[i].heap_id = 0;
        g->vertex[i].from_src = MY_INFINITY;
    }

    // Initialize heap
    h->n_elts = 0;

    // Initizalize for start points
    for(int32_t i = 0; i < src->count; i++) {
        int32_t  startId = src->id[i];
        g->vertex[startId].from_src = 0;
        g->vertex[startId].pred = -1;
        insert(g, h, startId);
    }

    // Implement dijkstra with heap
    while(get_size(h)) {
        int32_t curId = get_top(h);
        pop(g, h);

        if(g->vertex[curId].heap_id != 0) {
            continue;
        }

        g->vertex[curId].heap_id = 1;
        vertex_t* curVertex = &(g->vertex[curId]);

        for(int32_t k = 0; k < curVertex->n_neighbors; k ++) {
            int32_t extId = curVertex->neighbor[k];
            if(!g->vertex[extId].heap_id && g->vertex[curId].from_src + curVertex->distance[k] < g->vertex[extId].from_src) {
                printf("%d\n", extId);
                g->vertex[extId].from_src = g->vertex[curId].from_src + curVertex->distance[k];
                g->vertex[extId].pred = curId;
                insert(g, h, extId);
            }
        }
    }

    // Find shortest endponits
    int32_t minn = MY_INFINITY;
    int32_t destX = -1;
    for(int32_t i = 0; i < dest->count; i ++) {
        int32_t destId = dest->id[i];
        if(g->vertex[destId].from_src < minn) {
            minn = g->vertex[destId].from_src;
            destX = destId;
        }
    }

    // Do not have
    if(destX == -1) {
        path->tot_dist = MY_INFINITY;
        return 0;
    }

    int32_t id[MAX_PATH_LENGTH];

    path->tot_dist = minn;
    path->n_vertices = 0;
    for(int32_t i = destX; i != -1; i = g->vertex[i].pred) {
        if(path->n_vertices >= MAX_PATH_LENGTH) {
            //TODO: Whether should we return 0, or break
            return 0;
        }
        id[path->n_vertices++] = i;
    }
    for(int32_t i = 0; i < path->n_vertices; i++) {
        path->id[i] = id[path->n_vertices-i-1];
    }

    return 1;
}

