`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2022 11:57:42 AM
// Design Name: 
// Module Name: TB_MAC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`define bits 16
`define CLOCK 100

module TB_MAC ;
    
    // Inputs
//    reg                     clk;
//    reg                     reset;
    reg     [(2*`bits)-1:0] In0;
    reg     [(2*`bits)-1:0] In1;
    reg     [(2*`bits)-1:0] In_twiddle;
    // Outputs
    wire    [(2*`bits)-1:0] Out0;
    wire    [(2*`bits)-1:0] Out1;
    
    MAC #(7, 16) MC0 (.In1(In1), .In0(In0), .In_twiddle({{2*16-7-1{1'b0}},1'b1,{7{1'b0}}}), .Out0(Out0), .Out1(Out1));
    
    initial
        begin
//            clk = 1;
            In0 = 32'b000000000_0000000__000000001_0000000;
            In1 = 32'b000000000_0000000__000000001_0000000;
            In_twiddle = 32'b000000000_0000000__000000001_0000000;
            #10
            In0 = 32'b000000000_0000000__000000010_0000000;
            In1 = 32'b000000000_0000000__000000100_0000000;
            #20
            In0 = 32'b000000000_0000000__000001000_0000000;
            In1 = 32'b000000000_0000000__000010000_0000000;
//            reset = 1;
//            #10
//            reset = 0;
        end
    
//    always #(500/`CLOCK)    clk = !clk;
    
//    always @(posedge clk)
//        begin
//            In1 = In1 + 22'b000000_00000__000000_10000;
            
//        end
endmodule
