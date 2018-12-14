#include <stdio.h>
#include <stdlib.h>


static const int num = 2000;

int main() {
    for(int i = 1; i <= num; i++) {
        printf("Begin %d req;", i);
        system("./genreq graph request1 100000 0 150000 150000 2000000 2000000 150 3000");
        system("./mp10 graph request1 > mp10.out");
        system("./mp10_gold graph request1 > gold.out");
        system("diff mp10.out gold.out");
    }
    return 0;
}