# distutils: language = c++
# distutils: sources = mt19937.cpp

cdef extern from "mt19937.h" namespace "mtrandom":
    unsigned int N
    cdef cppclass MT_RNG:
        MT_RNG()
        MT_RNG(unsigned long s)
        MT_RNG(unsigned long init_key[], int key_length)
        void init_genrand(unsigned long s)
        unsigned long genrand_int32()
        double genrand_real1()
        double operator()()

cdef extern from "tt.h":
    cpdef cppclass jim:
        jim()
        int a
        int b
        double aa


cdef class jimmy:
    """ wrapper around jimmy :-)"""
    cdef jim *_thisptr
    #cdef double aa 
    def __cinit__(self):
        self._thisptr = new jim()
        if self._thisptr == NULL:
            raise MemoryError()

    """def __init__(self):
        self.aa = self._thisptr.a"""

    def __dealloc__(self):
        if self._thisptr != NULL:
            del self._thisptr

    def set_aa(self, aa): # mejor usamos __set__()
        self._thisptr.aa = aa
        return self._thisptr.aa

    cpdef set_value(self, name, value):
        self._thisptr.aa = value

    property aa:
        def __get__(self):      return self._thisptr.aa
        def __set__(self, v):   self._thisptr.aa = v



    #cdef double self.aa = double(self._thisptr.a)

    """
    cpdef unsigned long randint(self):
        return self._thisptr.genrand_int32()

    cpdef double rand(self):
        return self._thisptr.genrand_real1()
    """


cdef class RNG:
    cdef MT_RNG *_thisptr

    def __cinit__(self, unsigned long s):
        self._thisptr = new MT_RNG(s)
        if self._thisptr == NULL:
            raise MemoryError()

    def __dealloc__(self):
        if self._thisptr != NULL:
            del self._thisptr

    cpdef unsigned long randint(self):
        return self._thisptr.genrand_int32()

    cpdef double rand(self):
        return self._thisptr.genrand_real1()
