# distutils: language = c++
"""
NOTE: cython processes .pxd files fisrt!
"""

cdef extern from "nr3.h":
    cdef cppclass NRvector[T]:
        NRvector(int n) except +
        NRvector(int n, const T *array) except +
        NRvector(int n, const T &value) except +
        #NRvector & operator=(NRvector &rhs)
        T& operator[](int i)

ctypedef NRvector[double] VecDoub
