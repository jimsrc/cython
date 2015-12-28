/*

simple C function that alters data passed in via a pointer 
    
    used to see how we can do this with Cython/numpy
    
*/

void c_multiply (double* array, double multiplier, int m, int n) {
    int i, j ;
    int index = 0 ;
    
    for (i = 0; i < m; i++) {
        for (j = 0; j < n; j++) {
            array[index] = array[index]  * multiplier ;
            index ++ ;
            }
        }
    return ;
}

//double* c_gen2 (double multiplier, int m, int n) {
double* c_gen2 (int m, int n) {
    double *array;
    array = calloc(m*n, sizeof(double)); //new double[m*n];
    int i, j;
    int index = 0 ;
    
    for (i = 0; i < m; i++) {
        for (j = 0; j < n; j++) {
            array[index] = array[index]*2.;  //* multiplier ;
            index ++ ;
        }
    }
    return array;
}

void c_gen (double multiplier, int m, int n, double *array) {
    int i, j;
    int index = 0 ;
    
    for (i = 0; i < m; i++) {
        for (j = 0; j < n; j++) {
            array[index] = array[index]  * multiplier ;
            index ++ ;
        }
    }
}

/*
#include <stdio.h>

int main() {
    double array[3][4] =  {
        {1.0, 2.0, 3.0, 4.0},
        {5.0, 6.0, 7.0, 8.0},
        {9.0, 10.0, 11.0, 12.0},
    };
    
    int i, j, index=0 ;
     
    c_multiply( (double*) array, 3.0, 3, 4);
    for (i = 0; i < 3; i++) {
        for (j = 0; j < 4; j++) {
            printf("%f ", array[i][j]);
            index ++ ;
            }
        printf("\n");
    }
    return 0;
}

*/    
