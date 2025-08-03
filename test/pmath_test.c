#include "pmath.h"
#include "stdio.h"
#include "testlib.h"
#include "types.h"

// Test Variables

// Helper Functions

bool div_t_compare(div_p a, div_p b) {
    return (a.quot == b.quot) && (a.rem == b.rem);
}

// Basic Operations

void abs_of_3() {
    int actual;
    int n = 3;
    int expected = 3;

    actual = pabs(n);

    assert_continue(actual == expected);
}

void abs_of_neg_3() {
    int actual;
    int n = -3;
    int expected = 3;

    actual = pabs(n);

    assert_continue(actual == expected);
}

void div_5_by_2() {
    div_p actual;
    int x = 5, y = 2;
    div_p expected = {/* quot */ 2, /* rem */ 1};

    actual = pdiv(x, y);

    assert_continue(div_t_compare(actual, expected));
}

void div_2_by_5() {
    div_p actual;
    int x = 2, y = 5;
    div_p expected = {/* quot */ 0, /* rem */ 2};

    actual = pdiv(x, y);

    assert_continue(div_t_compare(actual, expected));
}

void div_420_by_69() {
    div_p actual;
    int x = 420, y = 69;
    div_p expected = {/* quot */ 6, /* rem */ 6};

    actual = pdiv(x, y);

    assert_continue(div_t_compare(actual, expected));
}

int main() {
    // Basic Operations
    test_handler("abs of 3", abs_of_3);
    test_handler("abs of neg 3", abs_of_neg_3);

    test_handler("div 5 by 2", div_5_by_2);
    test_handler("div 2 by 5", div_2_by_5);
    test_handler("div 420 by 69", div_420_by_69);

    // Output
    test_output(__FILE__);
}