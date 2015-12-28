"""
multiply.pyx

simple cython test of accessing a numpy array's data

the C function: c_multiply multiplies all the values in a 2-d array by a scalar, in place.

"""

import cython
from cython.operator cimport dereference as deref
#import cython.ctypes as cc
#from cython import double as Doub
import ctypes as C
from ctypes.util import find_library
from ctypes import (
    CDLL, c_void_p, c_int, c_double, sizeof, POINTER
)
from ctypes import cast
from numpy.ctypeslib import ndpointer

# import both numpy and the Cython declarations for numpy
import numpy as np
cimport numpy as np

# declare the interface to the C code
cdef extern void c_multiply (double* array, double value, int m, int n) 
cdef extern void c_gen (double multiplier, int m, int n, double *array)
cdef extern double* c_gen2 (int m, int n, double value)

@cython.boundscheck(False)
@cython.wraparound(False)
def multiply(np.ndarray[double, ndim=2, mode="c"] input not None, double value):
    """
    multiply (arr, value)
    
    Takes a numpy array as input, and multiplies each elemetn by value, in place
    
    param: array -- a 2-d numpy array of np.float64
    param: value -- a number that will be multiplied by each element in the array
    """
    cdef int m, n
    m, n = input.shape[0], input.shape[1]
    c_multiply (&input[0,0], value, m, n)
    return input #None


def get_array2(double value, int m, int n):
    SIZE = m*n #10
    print " lib:  ", find_library('c')
    libc = CDLL(find_library('c'))
    libc.malloc.restype = c_void_p
    data_pointer = libc.malloc(SIZE * sizeof(c_double))
    print " ---> libc.malloc: ", type(data_pointer)
    data_pointer = cast(data_pointer,POINTER(c_double))
    print " ---> cast: ", type(data_pointer)
    new_array = np.ctypeslib.as_array(data_pointer,shape=(SIZE,))
    print " ---> np.array:\n ", new_array
    print type(new_array)

    cdef:
        double* a
    #print " ---> a: ", type(a)

    # http://stackoverflow.com/questions/23930671/how-to-create-n-dim-numpy-array-from-a-pointer
    lib = C.CDLL('./multiply.so')
    #print " --> dir: ", dir(lib.c_gen2)  # imprime atributos
    lib.c_gen2.restype  = ndpointer(dtype=C.c_double, shape=(m*n,))
    lib.c_gen2.argtypes = [c_int, c_int, c_double]
    res = lib.c_gen2(m, n, value)
    print " ---> res: ", res
    print " ---> res.type: ", type(res)
    print " ---> res.dt: ", res.dtype

    #print dict(np)  # no lo lee :\
    #c_gen(value, m, n, C.byref(data_pointer))

    return None


def get_array(double value, np.ndarray[double, ndim=2, mode="c"] out not None):
    SIZE=10
    #a = np.ndarray(np.float64 , ndim=2, mode="c", buffer=&out[0,0])
    libc = CDLL(find_library('c'))
    libc.malloc.restype = c_void_p
    data_pointer = libc.malloc(SIZE * sizeof(c_int))
    print " ---> libc.malloc: ", type(data_pointer)
    data_pointer = cast(data_pointer,POINTER(c_int))
    print " ---> cast: ", type(data_pointer)
    new_array = np.ctypeslib.as_array(data_pointer,shape=(SIZE,))
    print " ---> np.array:\n ", new_array
    print type(new_array)

    cdef:
        double* a
    #print " ---> a: ", type(a)
    """
    cdef:
        double* a
        cdef np.ndarray[np.double_t, ndim=2] aa = np.zeros(10)
    """
    """a   = &out[0,0]
    op  = deref(out[0,0])
    b   = np.ctypeslib.as_arrray(op)"""

    #cdef int m, n
    m, n = out.shape[0], out.shape[1]
    #out = np.ndarray(double, ndim=2, mode="c")
    c_gen (value, m, n, &out[0,0])
    return None


def multiply2(np.ndarray[double, ndim=2, mode="c"] input not None, double value):
    """
    this method works fine, but is not as future-proof the nupy API might change, etc.
    """
    cdef int m, n
    m, n = input.shape[0], input.shape[1]
    c_multiply (<double*> input.data, value, m, n)
    return None

