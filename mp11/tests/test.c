int main() {
    int x;
    int i;
    x = 0;
    i = 3;
    for (i = 0; 9 > i; i++) {
        if (5 <= ++i) {

        } else {
            x++;
        }
    }
    printf ("x: %d, i: %d\n",
            x, i);
    return 0;
}