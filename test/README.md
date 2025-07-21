# libp Testing

This is a general guide on how to write tests for lib.

## File Structure

blah blah blah something about testlib.c, file set up, and function naming. Someone will eventually write this...

## Test Structure

Most tests will have the same structure. This structure can be referred to as **arrange**, **act**, **assert**. Tests must _arrange_ the state of the program, _act_ on the function under test, then _assert_ that the program is in the expected state afterwards.

These steps consist of the following:

- The **arrange** step is for setting up details of the program specific to the test. This involves created variables and instantiating structs.

- The **act** step if where you actually make the calls to the function or feature you are testing. This will usually be a single function call but if multiple are being tested they will all be in this block

- The **assert** step is where you make assertions about the program state after the act step. Here you ensure that your function and features are working as intended by verification.

Here is an example of good and bad test functions

```c
// my_tests.c

void fib(){
    // fibonacci sequence function
}

void bad_test_function() {
    int expected_value_1 = 55
    int result_1 = fib(10) // Separate blocks from each other
    assert_continue(result_1 == expected_value_1)

    
    // Don't intertwine steps
    int expected_value_2 = 69;
    int result_2 = some_other_function();
    // Only 1 behavior should be tested per function
    assert_continue(result_2 + 17 * 6, expected_value_1 + expected_value_2)
    // Keep assertions simple
}

void good_test_function() {
    // Arrange
    int result;
    int expected_value = 610;

    // Act
    result = fib(15)

    // Assert
    assert_continue(result == expected_value);
}

```
