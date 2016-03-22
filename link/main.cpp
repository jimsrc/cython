#include <stdio.h>
extern void myfunc(double&);

int main(){
    double a;
    myfunc(a);
    printf(" --> a: %g\n", a);
}
