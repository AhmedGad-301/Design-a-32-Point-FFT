`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2022 01:06:21 AM
// Design Name: 
// Module Name: SUB
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


module SUB #(parameter fix_bit = 7, parameter bits = 16)(
    input   [bits-1:0]  INPUT0,
    input   [bits-1:0]  INPUT1,
    output  [bits-1:0]  OUTPUT
    );
    
    wire    [bits-1:0]  INPUT1_ED;
    wire    [bits:0]    out_sub;
    
    assign INPUT1_ED = !(INPUT1[bits-1]) ? {!(INPUT1[bits-1]),~INPUT1[bits-2:0] + 1} : {!(INPUT1[bits-1]),~INPUT1[bits-2:0] + 1};
    assign out_sub = INPUT0 + INPUT1_ED;
    assign OUTPUT = out_sub[bits-1] ? {1'b1,~out_sub[bits-2:0] + 1} : out_sub[bits-1:0];
    
endmodule
