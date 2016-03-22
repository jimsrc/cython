""" Small Cython file to demonstrate the use of PyArray_SimpleNewFromData
in Cython to create an array from already allocated memory.

Cython enables mixing C-level calls and Python-level calls in the same
file with a Python-like syntax and easy type cohersion. See 
http://cython.org for more information
"""
# Declare the prototype of the C function we are interested in calling

cdef extern from "code2.cpp":
    void myfunc(double*)

from libc.stdlib cimport free
from cpython cimport PyObject, Py_INCREF

# Import the Python-level symbols of numpy
import numpy as np

# Import the C-level symbols of numpy
cimport numpy as np

# Numpy must be initialized. When using numpy from C or Cython you must
# _always_ do that, or you will have segfaults
np.import_array()

def py_myfunc(a):
    
    cdef double *aa #aa=6.66
    myfunc(aa)
    #print " ---> aa (@cython): ", (*aa)

#EOF
