# distutils: language = c++
"""
NOTE: cython processes .pxd files fisrt!
"""

cdef extern from "nr3.h":
    #------ NRvector ------#
    cdef cppclass NRvector[T]:
        NRvector(int n) except +
        NRvector(int n, const T *array) except +
        NRvector(int n, const T &value) except +
        #NRvector & operator=(NRvector &rhs)
        T& operator[](int i)

    #------ NRmatrix ------#
    cdef cppclass NRmatrix[T]:
        NRmatrix()
        NRmatrix(int n, int m) except +
        NRmatrix(int n, int m, const T &a) #Initialize to constant
        NRmatrix(int n, int m, const T *a) #Initialize to array
        T* operator[](const int i) #subscripting: pointer to row i
        int nrows() 
        int ncols() const
        void resize(int newn, int newm)

ctypedef double Doub
ctypedef int Int
ctypedef NRvector[Doub] VecDoub
ctypedef NRmatrix[Doub] MatDoub


cdef extern from "tt.h":
    cdef cppclass mgr:
        mgr()
        int a
        VecDoub v
        MatDoub m
#EOF
