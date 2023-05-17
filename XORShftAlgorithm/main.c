/***********************************************************************************************
 * Author: S'thabiso Lushaba
 * Date  : 15 May, 2023
 * An implementation of the XORshift algorithm.
*/

#include <stdio.h>

unsigned int xorshift32(unsigned int *state) {
   // this implementation uses a 32-bit version of the XORshift algorithm

    unsigned int temp = *state; //temporary state
    temp ^= temp << 7;
    temp ^= temp >> 9;
    temp ^= temp << 13;
    *state = temp;
    return temp;
}

int main() {
    unsigned int state = 123456789;  // Initial state, which is arbitrary. 

    // Generate and print 10 random numbers
    for (int i = 0; i < 10; i++) {
        unsigned int random = xorshift32(&state);
        printf("%u\n", random);
    }

    return 0;
}
