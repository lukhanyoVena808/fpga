`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCT
// Engineer: Team 10
// 
// Create Date: 15/05/2023
// Design Name: Linear feedback shift register
// Module Name: lfsr_tb
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


module lfsr_tb(

    );
    localparam N = 32;
    parameter Num=3;
    reg clk,reset_n;
    wire [1:N] Q;
    

    //instnatiate the module that makes multiple LFSRs
    RNG #(.Num(Num)) md(.clk(clk),.reset_n(reset_n),.Q(Q));
   
    
    // Instantuate unit under test, to test 1 LFSR alone
   /* lfsr #(.N(N),.seed(2)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );*/
  
    // Generating a clk signal
    localparam T = 10; //10ns
    always
    begin
        clk = 1'b0;
        #(T / 2); //toggle clock evry 5ns
        clk = 1'b1;
        #(T / 2);
    end
    
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2 
        reset_n = 1'b1;
       
        $monitor("Q:%d",Q);
        
        repeat(2) @(negedge clk);
        wait (Q == 1); //halts exec until Q=1 then stops
        //stops simulation when a full period has elapsed if we start at 1
        //generates a random number every 10ns
        //runs for 1000ns so generates 100 random numbers sequentially
  
       #100 $finish;
    end
    
endmodule
