def run():
    cdef VecDoub *v
    v = new VecDoub(3, 88.66) # this works!!! :D
    #v = VecDoub(3)
    #cdef Vecdoub v = VecDoub(3)
    v[0][2] = 888.555
    #par.test(v[0]) # efectivamente, se puede leer desde C
    print " Vecdoub: ", v[0][1]
    del v  # equivalent to "delete v[]" in c++

#EOF
