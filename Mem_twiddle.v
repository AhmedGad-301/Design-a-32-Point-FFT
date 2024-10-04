`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2022 05:02:08 PM
// Design Name: 
// Module Name: Mem_twiddle
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


module Mem_twiddle#(parameter fix_bit = 5, parameter bits = 11)(
    input   [3:0]       ADDR,
    output  [bits-1:0]  Data
    );
    reg [bits-1:0] tw_valu [0:15];
    
    initial
        begin
            tw_valu[0]  = 32'b0000000000000000_0000000010000000;            // 1      + 0j
            tw_valu[1]  = 32'b1000000000011000_0000000001111101;            // 0.9808 - 0.1951j
            tw_valu[2]  = 32'b1000000000110000_0000000001110110;            // 0.9239 - 0.3827j
            tw_valu[3]  = 32'b1000000001000111_0000000001101010;            // 0.8315 - 0.5556j
            tw_valu[4]  = 32'b1000000001011010_0000000001011010;            // 0.7071 - 0.7071j
            tw_valu[5]  = 32'b1000000001101010_0000000001000111;            // 0.5556 - 0.8315j
            tw_valu[6]  = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[7]  = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[8]  = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[9]  = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[10] = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[11] = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[12] = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[13] = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[14] = 32'b0000000000000000_0000000010000000;            // 1 + 0j
            tw_valu[15] = 32'b0000000000000000_0000000010000000;            // 1 + 0j
        end
    assign Data = tw_valu[ADDR];
    
endmodule