`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 02:18:40 AM
// Design Name: 
// Module Name: CU
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
`define CLOCK1 100
`define CLOCK2 50

module CU;
    
    reg clk_100;
    
    wire [3:0] enable;
    wire [1:0] SEL;
    
    Control_unit CU0 (
    .clk_100(clk_100),
    .enable(enable),
    .SEL(SEL)
    );
    
    initial
        begin
            clk_100 = 1;
        end
    
    always #(500/`CLOCK1) clk_100 = !clk_100;
    
endmodule


