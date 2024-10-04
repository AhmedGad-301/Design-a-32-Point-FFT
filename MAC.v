`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2022 05:02:08 PM
// Design Name: 
// Module Name: MAC
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


module MAC #(parameter fix_bit = 7, parameter bits = 16)(
    input   wire    [(2*bits)-1:0]  In1,                // Real (0 -> bits-1), Imag (bits -> 2*bits-1)
    input   wire    [(2*bits)-1:0]  In0,                // Real (0 -> bits-1), Imag (bits -> 2*bits-1)
    input   wire    [(2*bits)-1:0]  In_twiddle,         // Real (0 -> bits-1), Imag (bits -> 2*bits-1)
    output  wire    [(2*bits)-1:0]  Out0,               // Real (0 -> bits-1), Imag (bits -> 2*bits-1)
    output  wire    [(2*bits)-1:0]  Out1                // Real (0 -> bits-1), Imag (bits -> 2*bits-1)
    );
    
    wire    [bits-1:0]  real1_wir;
    wire    [bits-1:0]  imag1_wir;
    wire    [bits-1:0]  real2_wir;
    wire    [bits-1:0]  imag2_wir;
    
    wire    [bits-1:0]  out_adder_real_1;
    wire    [bits-1:0]  out_adder_imag_1;
    wire    [bits-1:0]  out_sub_real_2;
    wire    [bits-1:0]  out_sub_imag_2;
    
    /*------------------------------------------- Complex Multiplier -------------------------------------------*/
    // real1_wir = real1 * realt
    Multiplier #(fix_bit, bits) M0 (.INPUT1(In1[bits-1:0]), .INPUT2(In_twiddle[bits-1:0]), .OUTPUT(real1_wir));
    // imag1_wir = realt * imag1
    Multiplier #(fix_bit, bits) M1 (.INPUT1(In_twiddle[bits-1:0]), .INPUT2(In1[2*bits-1:bits]), .OUTPUT(imag1_wir));
    // real2_wir = imag1 * imagt
    Multiplier #(fix_bit, bits) M2 (.INPUT1(In1[2*bits-1:bits]), .INPUT2(In_twiddle[2*bits-1:bits]), .OUTPUT(real2_wir));
    // imag2_wir = real1 * imagt
    Multiplier #(fix_bit, bits) M3 (.INPUT1(In1[bits-1:0]), .INPUT2(In_twiddle[2*bits-1:bits]), .OUTPUT(imag2_wir));
    /*----------------------------------------------------------------------------------------------------------*/
    
    Adder #(fix_bit, bits) A0 (.INPUT0((real1_wir - real2_wir)), .INPUT1(In0[bits-1:0]), .OUTPUT(out_adder_real_1));
    Adder #(fix_bit, bits) A1 (.INPUT0((imag1_wir + imag2_wir)), .INPUT1(In0[2*bits-1:bits]), .OUTPUT(out_adder_imag_1));
    
    SUB #(fix_bit, bits) S0 (.INPUT0(In0[bits-1:0]), .INPUT1((real1_wir - real2_wir)), .OUTPUT(out_sub_real_2));
    SUB #(fix_bit, bits) S1 (.INPUT0(In0[2*bits-1:bits]), .INPUT1((imag1_wir + imag2_wir)), .OUTPUT(out_sub_imag_2));
    
    assign Out0 = {out_adder_imag_1,out_adder_real_1};
    assign Out1 = {out_sub_imag_2,out_sub_real_2};
    
endmodule
