/***********************************************************************************************
 * Author: S'thabiso Lushaba
 * Date  : 15 May, 2023
 * An implementation of the XORshift algorithm.
*/

#include <stdio.h>
#include<stdint.h>

uint32_t xorshift32(uint32_t *state) {
   // this implementation uses a 32-bit version of the XORshift algorithm

    uint32_t temp = *state; //temporary state
    temp ^= temp << 7;
    temp ^= temp >> 9;
    temp ^= temp << 13;
    *state = temp;
    return temp;
}

int main() {
    uint32_t state = 123456789;  // Initial state, which is arbitrary. 

    // Generate and print 10 random numbers
    for (int i = 0; i < 10; i++) {
        uint32_t random = xorshift32(&state);
        printf("%u\n", random);
    }

    return 0;
}
