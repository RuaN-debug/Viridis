#include <stdio.h>

void bubble_sort(int a[], int n) {
    int i, j, aux;
    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - i - 1; j++) {
            if (a[j] > a[j + 1]) {
                aux = a[j];
                a[j] = a[j + 1];
                a[j + 1] =aux;
            }
        }
    }
    
    printf("\n List Sorted in Ascending Order : ");
    for (i = 0; i < n; i++) {
        printf(" %d \t", a[i]);
    }
    printf("\n");
}

int main() {
    int teste[] = {1, 7, 8, 4, 5, 2, 3, 9, 6};
    bubble_sort(teste, sizeof(teste)/sizeof(teste[0]));
    return 0;
}