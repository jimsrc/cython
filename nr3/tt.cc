#ifndef TT_CC
#define TT_CC
# include "tt.h"

mgr::mgr(){
    int nx=7, ny =9;
    v = VecDoub(nx, 0.88);
    m = MatDoub(nx, ny, 0.33);
}

#endif TT_CC
