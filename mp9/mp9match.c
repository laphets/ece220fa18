#include <stdint.h>
#include <stdio.h>

#include "mp5.h"
#include "mp9.h"



/**
 * find graph vertices within range of the starting and ending locales
 * for two requests and find a shortest path between any vertex in the
 * starting set and any vertex in the ending set.  return 1 on success,
 * or 0 on failure
 * @param g pointer to the graph
 * @param p pointer to the pyr tree
 * @param h pointer to the heap
 * @param r1 pointer to the request1
 * @param r2 pointer to the request2
 * @param src_vs pointer to the src set
 * @param dst_vs pointer to the dst set
 * @param path pointer to the path
 * @return 1 on success, 0 on failure
 */
int32_t
match_requests (graph_t* g, pyr_tree_t* p, heap_t* h,
		request_t* r1, request_t* r2,
		vertex_set_t* src_vs, vertex_set_t* dst_vs, path_t* path)
{
    // Try to fliter in another way
    // For src
    src_vs->count = 0;
    find_nodes(&r1->from, src_vs, p ,0);
//    printf("[src]: %d calls to find_nodes\n", find_nodes_inst(&r1->from, src_vs, p ,0));
//    printf("[src]: %d nodes found\n", src_vs->count);
    trim_nodes(g, src_vs, &r2->from);
//    printf("[src]: %d nodes retained\n", src_vs->count);


    // For dest
    dst_vs->count = 0;
    
    find_nodes(&r1->to, dst_vs, p, 0);
//    printf("[dst]: %d calls to find_nodes\n", find_nodes_inst(&r1->to, dst_vs, p, 0));
//    printf("[dst]: %d nodes found\n", dst_vs->count);
    trim_nodes(g, dst_vs, &r2->to);
//    printf("[dst]: %d nodes retained\n", dst_vs->count);


    // Src
//    vertex_set_t src_req1, src_req2;
//    src_req1.count = 0;
////    find_nodes(&r1->from, &src_req1, p, 0);
//    printf("req1_src: %d\n", find_nodes_inst(&r1->from, &src_req1, p, 0));
//    src_req2.count = 0;
////    find_nodes(&r2->from, &src_req2, p, 0);
//    printf("req2_src: %d\n", find_nodes_inst(&r2->from, &src_req2, p, 0));
//
//    src_vs->count = 0;
//
//    for(int32_t i = 0; i < src_req1.count; i++) {
//        int32_t curId = src_req1.id[i];
//        for(int32_t j = 0; j < src_req2.count; j++) {
//            if(curId == src_req2.id[j]) {
//                // Both exist, then push
//                src_vs->id[src_vs->count++] = curId;
//                break;
//            }
//        }
//    }
//    printf("src: %d nodes found for req1, %d nodes found for req2, %d nodes retained\n", src_req1.count, src_req2.count, src_vs->count);

    // Dst
//    vertex_set_t dst_req1, dst_req2;
//    dst_req1.count = 0;
////    find_nodes(&r1->to, &dst_req1, p, 0);
//    printf("req1_dst: %d\n", find_nodes_inst(&r1->to, &dst_req1, p, 0));
//    dst_req2.count = 0;
////    find_nodes(&r2->to, &dst_req2, p, 0);
//    printf("req2_dst: %d\n", find_nodes_inst(&r2->to, &dst_req2, p, 0));
//
//
//    dst_vs->count = 0;
//
//    for(int32_t i = 0; i < dst_req1.count; i++) {
//        int32_t curId = dst_req1.id[i];
//        for(int32_t j = 0; j < dst_req2.count; j++) {
//            if(curId == dst_req2.id[j]) {
//                // Both exist, then push
//                dst_vs->id[dst_vs->count++] = curId;
//                break;
//            }
//        }
//    }
//
//    printf("dst: %d nodes found for req1, %d nodes found for req2, %d nodes retained\n", dst_req1.count, dst_req2.count, dst_vs->count);


    if(src_vs->count == 0 || dst_vs->count == 0) {
        return 0;
    }

    int32_t res = dijkstra(g, h, src_vs, dst_vs, path);

//    printf("min dest is %d at %d\n", path->id[0], path->tot_dist);

    return res;
}
