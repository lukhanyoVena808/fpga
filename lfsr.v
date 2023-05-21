`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCT
// Engineer: Team 10
// 
// Create Date: 15/05/2023
// Design Name: Linear feedback shift register
// Module Name: lfsr_tb FIBONNACCI VERSION
// Project Name: PRNG
// Target Devices: Nexys A7 100-T
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr
    #(parameter N = 32,parameter seed ='d1)( //No of bits =N, can specify seed at instantiation
    input clk,
    //input seed,
    input reset_n,
    output [1:N] Q//generated random number register
    
    
    );
    
    
   // reg [32:1]count = 32'b0;
    //Assumes MSB is bit 1, LSB=bit N, not strating from 0 but this can be changed
    reg [1:N] Q_reg, Q_next;
    wire taps; //positions that are XOR to get next state

    always @(posedge clk, negedge reset_n)//on positive clk or negative reset
    begin
        if (~reset_n) //if reset==0, initial state
            //Q_reg <= 'd1; // LSFR seed can be anything except 0 or FFFFFFFF
            Q_reg <= seed;
        else
            Q_reg <= Q_next; //assign the next generated number to register
            //count=count+1;
    end
    
    // Next state logic
    always @(taps, Q_reg)
        Q_next = {taps, Q_reg[1:N - 1]}; //equivalent to left shift and XOR
                                        //with Taps

        
    // Output logic
    assign Q = Q_reg; //assign current state to output signal
    
    //-------------------------------------------------------------    

    //N=32, tap positions give the longest period before repeats see docs
     assign taps=Q_reg[32] ^ Q_reg[22]^ Q_reg[2] ^ Q_reg[1];
 

        
endmodule

module RNG
 #(parameter Num=3)(
 //input [Num:1] clk,
// input [Num:1] reset_n,
 input clk,
 input reset_n,
 output [1:32] Q
 //output [Num:1] Q  // [Num-1:0] Q [1:N]
 
 );
 
 wire [1:32] Q1,Q2,Q3;
 //lfsr #(.N(32)) LFSRs[Num:1] (clk,reset_n,Q);
 lfsr #(.N(32),.seed(2)) LFSR2(clk,reset_n,Q1);
 lfsr #(.N(32),.seed(3)) LFSR3(clk,reset_n,Q2);
 lfsr #(.N(32),.seed(4)) LFSR4(clk,reset_n,Q3);
 
 assign Q={Q1,Q2,Q3};
 
 /*genvar i;
 generate 
    for(i=0;i<Num;i=i+1)begin
        lfsr #(.N(32)) LFSR (clk[i],reset_n[i],Q[i]);
        end
 endgenerate 
 */
endmodule 