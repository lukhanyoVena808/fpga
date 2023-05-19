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
    reg [Num-1:0]clk, reset_n;
    wire [Num-1:0] Q;

    
    RNG #(.Num(Num)) md(.clk(clk),.reset_n(reset_n),.Q(Q));
   
    
    // Instantuate unit under test
   /* lfsr #(.N(N),.seed(2)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );*/
  
   
    
   /* generate
        genvar i;
        for (i = 1; i < NUM_LFSR; i = i + 1) begin : INSTANCES
            lfsr #(.N(N),.seed(seedArray[i)) uut (
                .clk(clk),
                .reset_n(reset_n),
                .Q(Q)
            );
        end
    endgenerate*/
    
   
    // Generating a clk signal
    localparam T = 10; //10ns
    always
    begin
        clk = 1'b0;
        #(T / 2); //toggle clock evry 5ns
        clk = 1'b1;
        #(T / 2);
    end
    // generator #(.Num(Num)) MOD(.seedArr(seedArray))
    /*
    initial begin
        clk = 1'b0;
        forever begin
            #(5);
            clk = ~clk;
        end
    end
    
    
    */
    
    initial
    begin
        // issue a quick reset for 2 ns
        reset_n = 1'b0;
        #2 //#5; 
        reset_n = 1'b1;
       
        $monitor("Q:%d",Q);
        
        
      
        
   
        repeat(2) @(negedge clk);
        wait (Q == 1); //halts exec until Q=1 then stops
        //stops simulation when a full period has elapsed if we start at 1
        //generates a random number every 10ns
        //runs for 1000ns so generates 100 random numbers sequentially
        
        #20 $stop;
       // #100 $finish;
    end
    
endmodule
