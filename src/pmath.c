#include "pmath.h"
#include "types.h"

// Basic Operations

int pabs(int n) {
    return (n > 0) ? n : -n;
}

div_p pdiv(int x, int y) {
    div_p ret;
    ret.quot = x / y;
    ret.rem = x % y;
    return ret;
}