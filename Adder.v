`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2022 02:15:22 AM
// Design Name: 
// Module Name: Adder
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


module Adder #(parameter fix_bit = 7, parameter bits = 16)(
    input   [bits-1:0]  INPUT0,
    input   [bits-1:0]  INPUT1,
    output  [bits-1:0]  OUTPUT
    );
    
    wire    [bits-1:0]  INPUT1_ED;
    wire    [bits:0]    out_add;
    wire    [bits-1:0]  TR_out;
    
    assign INPUT1_ED = INPUT1[bits-1] ? {1'b1,~INPUT1[bits-2:0] + 1} : {1'b0,INPUT1[bits-2:0]};
    assign out_add = INPUT0 + INPUT1_ED;
    assign TR_out = out_add[bits-1] ? {1'b1,~out_add[bits-2:0] + 1} : out_add[bits-1:0];
    assign OUTPUT = TR_out;
    
endmodule
