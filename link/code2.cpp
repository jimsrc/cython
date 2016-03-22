
#include <stdlib.h>


double *ret_1d_array(double value, int size){
    double* array;
    //array = malloc(sizeof(double)*size); // OK with C
    array = (double*) malloc(sizeof(double)*size);  // ok with c++
    int i;
    for (i=0; i<size; i++){
        array[i] = value;
    }
    return array;
}


void myfunc(double *a){
    (*a) = 99.999;
}
