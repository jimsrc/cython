#BOF
from libc.stdlib cimport free, malloc, calloc
from cpython cimport PyObject, Py_INCREF
#from libc.math cimport sqrt, sin, cos
from cython.operator cimport dereference as deref

def run():
    cdef VecDoub *v
    v = new VecDoub(3, 88.66) # this works!!! :D
    #v = VecDoub(3)
    #cdef Vecdoub v = VecDoub(3)
    v[0][2] = 888.555
    #par.test(v[0]) # efectivamente, se puede leer desde C
    print " Vecdoub: ", v[0][1]
    print " Vecdoub: ", deref(v)[0]
    del v  # equivalent to "delete v[]" in c++

    cdef mgr *Mgr
    Mgr = new mgr()

    cdef int nx, ny, i, j # esto es NECESARIO para el deref(&...)!! :O :O :O
    nx = Mgr.m.nrows()
    ny = Mgr.m.ncols()
    Mgr.m[1][2] = 77

    for i in range(nx):
        for j in range(ny):
            print Mgr.m[i][j], #m[0][i][j],
        print ""
    
    print "---------"
    for i in range(nx):
        for j in range(ny):
            print deref(&(Mgr.m[0][0]) + i*ny + j),
        print ""
    
    del Mgr
#EOF
