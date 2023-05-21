# TEAM 10: PARALLEL RANDOM NUMBER GENERATOR (YODA PROJECT 2023)
This repository hosts all the programs that were written for the PRNG for the project. The Your Own Digital Accelerator (YODA) project is undertaken annually by UCT 4th year electrical enginnering students
for the High Performance Embedded Systems course. For our group we were tasked with developing a parallel random number generator capable of running on a 
Nexys A7 100-t FPGA in order to digitally accelerate the process of generating pseudo random numbers.
## PROGRAMS WRITTEN 
The following programs were developed over the course of the project to implement the random number generator.
### Serial program (Golden Measure)
XORshift Algorithm (main.c) - written by S'thabiso Lushaba

This program served as a sequential version of the random number generator which implemneted an XOR shift algorithm to generate random numbers 
per the project requirments. Its execution time was used to determine the speed up of the parallel version compared to it.
### Parallel Program (Verilog Simulation)
LFSR module (lfsr.v) - written by Bina Mukuyamba and Lukhanyo Vena

This module was written in verilog to simulate how the random numbers would be generated in parallel on the FPGA hardware. It used the Linear Feedback Shift Register
algorithm to generate random numbers ranging from 0 to 2^32-1.

BRAM module - N/A

This module was supposed to provide a means of generating stroing the generated numbers on the BRAM on the FPGA

testbenches (lfsr_tb.v) - written by Matsoso Leseli
This module was written to test the above modules created

Further details of the design can be found in the report.
