`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2022 12:13:12 AM
// Design Name: 
// Module Name: Regs
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


module Regs #(parameter fix_bit = 7, parameter bits = 16)(
    input                       clk,
    input                       reset,
    input       [3:0]           enable,
    input       [(2*bits)-1:0]  in,
    output reg  [(2*bits)-1:0]  out0,
    output reg  [(2*bits)-1:0]  out1,
    output reg  [(2*bits)-1:0]  out2,
    output reg  [(2*bits)-1:0]  out3
    );
    
    always @(posedge clk, posedge reset)
        begin
            if (reset)
                begin
                    out0 = 0;
                    out1 = 0;
                    out2 = 0;
                    out3 = 0;
                end
            else if (clk)
                begin
                    if (enable[0])
                        out0 = in;
                    else if (enable[1])
                        out1 = in;
                    else if (enable[2])
                        out2 = in;
                    else if (enable[3])
                        out3 = in;
                end
        end
    
endmodule
