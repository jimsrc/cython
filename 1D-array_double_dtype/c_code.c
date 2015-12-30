/* Small C file creating an array to demo C -> Python data passing 
 * 
 * Author: Gael Varoquaux
 * License: BSD
 */

#include <stdlib.h>

double *compute(int size)
{
    double* array;
    array = malloc(sizeof(int)*size);
    int i;
    for (i=0; i<size; i++)
    {
	array[i] = i;
    }
    return array;
}

/*
float *compute_2d(int nx, int ny)
{
    int* array;
    array = malloc(sizeof(int)*size);
    int i;
    for (i=0; i<size; i++)
    {
	array[i] = i;
    }
    return array;
}
*/
