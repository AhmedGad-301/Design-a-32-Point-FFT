`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2022 05:03:04 PM
// Design Name: 
// Module Name: Multiplier
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


module Multiplier #(parameter fix_bit = 7, parameter bits = 16)(
    input [bits-1:0] INPUT1,
    input [bits-1:0] INPUT2,
    output [bits-1:0] OUTPUT
    );
    
    wire    [(2*bits-3):0]  out_mult;
    
    assign out_mult = INPUT1[bits-2:0] * INPUT2[bits-2:0];
    assign OUTPUT = (INPUT1[bits-1]^INPUT2[bits-1]) ? {1'b1,(~out_mult[(bits-2)+fix_bit:fix_bit]+1)} : {1'b0,(out_mult[(bits-2)+fix_bit:fix_bit])};
    
endmodule
