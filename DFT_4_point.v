`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 09:43:19 PM
// Design Name: 
// Module Name: DFT_4_point
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


module DFT_4_point #(parameter fix_bit = 7, parameter bits = 16)(
    input                       clk_100,
    input                       clk_20,
    input                       reset,
    input       [3:0]           enable,
    input       [1:0]           SEL,
    
    input       [(2*bits)-1:0]  in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,
                                in17,in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,
    
    output      [(2*bits)-1:0]  out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,
                                out14,out15,out16,out17,out18,out19,out20,out21,out22,out23,out24,out25,out26,
                                out27,out28,out29,out30,out31
    );
    
    wire    [(2*bits)-1:0]  out_reg0,out_reg1,out_reg2,out_reg3,out_reg4,out_reg5,out_reg6,out_reg7;
    wire    [(2*bits)-1:0]  out_reg8,out_reg9,out_reg10,out_reg11,out_reg12,out_reg13,out_reg14,out_reg15;
    wire    [(2*bits)-1:0]  out_reg16,out_reg17,out_reg18,out_reg19,out_reg20,out_reg21,out_reg22,out_reg23;
    wire    [(2*bits)-1:0]  out_reg24,out_reg25,out_reg26,out_reg27,out_reg28,out_reg29,out_reg30,out_reg31;
    
    // First block
    wire    [(2*bits)-1:0]  out_mux0;
    MUX #(fix_bit, bits) M0 (.IN0(in0), .IN1(in1), .IN2(in4), .IN3(in5), .SEL(SEL), .OUT(out_mux0));
    wire    [(2*bits)-1:0]  out_mux1;
    MUX #(fix_bit, bits) M1 (.IN0(in2), .IN1(in3), .IN2(in6), .IN3(in7), .SEL(SEL), .OUT(out_mux1));
    wire    [(2*bits)-1:0]  out_muxt0;
    MUX #(fix_bit, bits) Mt0 (.IN0(32'b0000000000000000_0000000010000000), 
                              .IN1(32'b1000000010000000_0000000000000000),
                              .IN2(32'b0000000000000000_0000000010000000),
                              .IN3(32'b1000000010000000_0000000000000000),
                              .SEL(SEL), .OUT(out_muxt0));
    wire    [(2*bits)-1:0]  out_mac0;
    wire    [(2*bits)-1:0]  out_mac1;
    MAC #(fix_bit, bits) MC0 (.In1(out_mux0), .In0(out_mux1),
                              .In_twiddle(out_muxt0),
                              .Out0(out_mac0), .Out1(out_mac1));
    
    
    
    Regs #(fix_bit, bits) R0 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac0),
                              .out0(out_reg0), .out1(out_reg1), .out2(out_reg4), .out3(out_reg5));
    Regs #(fix_bit, bits) R1 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac1),
                              .out0(out_reg2), .out1(out_reg3), .out2(out_reg6), .out3(out_reg7));
    
    // Second block
    wire    [(2*bits)-1:0]  out_mux2;
    MUX #(fix_bit, bits) M2 (.IN0(in8), .IN1(in9), .IN2(in12), .IN3(in13), .SEL(SEL), .OUT(out_mux2));
    wire    [(2*bits)-1:0]  out_mux3;
    MUX #(fix_bit, bits) M3 (.IN0(in10), .IN1(in11), .IN2(in14), .IN3(in15), .SEL(SEL), .OUT(out_mux3));
    wire    [(2*bits)-1:0]  out_muxt1;
    MUX #(fix_bit, bits) Mt1 (.IN0(32'b0000000000000000_0000000010000000), 
                              .IN1(32'b1000000010000000_0000000000000000),
                              .IN2(32'b0000000000000000_0000000010000000),
                              .IN3(32'b1000000010000000_0000000000000000),
                              .SEL(SEL), .OUT(out_muxt1));
    wire    [(2*bits)-1:0]  out_mac2;
    wire    [(2*bits)-1:0]  out_mac3;
    MAC #(fix_bit, bits) MC1 (.In1(out_mux2), .In0(out_mux3),
                              .In_twiddle(out_muxt1),
                              .Out0(out_mac2), .Out1(out_mac3));
                              
    
    
    Regs #(fix_bit, bits) R2 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac2),
                              .out0(out_reg8), .out1(out_reg9), .out2(out_reg12), .out3(out_reg13));
    Regs #(fix_bit, bits) R3 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac3),
                              .out0(out_reg10), .out1(out_reg11), .out2(out_reg14), .out3(out_reg15));
    
    // Third block
    wire    [(2*bits)-1:0]  out_mux4;
    MUX #(fix_bit, bits) M4 (.IN0(in16), .IN1(in17), .IN2(in20), .IN3(in21), .SEL(SEL), .OUT(out_mux4));
    wire    [(2*bits)-1:0]  out_mux5;
    MUX #(fix_bit, bits) M5 (.IN0(in18), .IN1(in19), .IN2(in22), .IN3(in23), .SEL(SEL), .OUT(out_mux5));
    wire    [(2*bits)-1:0]  out_muxt2;
    MUX #(fix_bit, bits) Mt2 (.IN0(32'b0000000000000000_0000000010000000), 
                              .IN1(32'b1000000010000000_0000000000000000),
                              .IN2(32'b0000000000000000_0000000010000000),
                              .IN3(32'b1000000010000000_0000000000000000),
                              .SEL(SEL), .OUT(out_muxt2));
    wire    [(2*bits)-1:0]  out_mac4;
    wire    [(2*bits)-1:0]  out_mac5;
    MAC #(fix_bit, bits) MC2 (.In1(out_mux4), .In0(out_mux5),
                              .In_twiddle(out_muxt2),
                              .Out0(out_mac4), .Out1(out_mac5));
    
    
    
    Regs #(fix_bit, bits) R4 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac4),
                              .out0(out_reg16), .out1(out_reg17), .out2(out_reg20), .out3(out_reg21));
    Regs #(fix_bit, bits) R5 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac5),
                              .out0(out_reg18), .out1(out_reg19), .out2(out_reg22), .out3(out_reg23));
    
    // Fourth block
    wire    [(2*bits)-1:0]  out_mux6;
    MUX #(fix_bit, bits) M6 (.IN0(in24), .IN1(in25), .IN2(in28), .IN3(in29), .SEL(SEL), .OUT(out_mux6));
    wire    [(2*bits)-1:0]  out_mux7;
    MUX #(fix_bit, bits) M7 (.IN0(in26), .IN1(in27), .IN2(in30), .IN3(in31), .SEL(SEL), .OUT(out_mux7));
    wire    [(2*bits)-1:0]  out_muxt3;
    MUX #(fix_bit, bits) Mt3 (.IN0(32'b0000000000000000_0000000010000000), 
                              .IN1(32'b1000000010000000_0000000000000000),
                              .IN2(32'b0000000000000000_0000000010000000),
                              .IN3(32'b1000000010000000_0000000000000000),
                              .SEL(SEL), .OUT(out_muxt3));
    wire    [(2*bits)-1:0]  out_mac6;
    wire    [(2*bits)-1:0]  out_mac7;
    MAC #(fix_bit, bits) MC3 (.In1(out_mux6), .In0(out_mux7),
                              .In_twiddle(out_muxt3),
                              .Out0(out_mac6), .Out1(out_mac7));
    
    
    
    Regs #(fix_bit, bits) R6 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac6),
                              .out0(out_reg24), .out1(out_reg25), .out2(out_reg28), .out3(out_reg29));
    Regs #(fix_bit, bits) R7 (.clk(clk_100), .reset(reset), .enable(enable), .in(out_mac7),
                              .out0(out_reg26), .out1(out_reg27), .out2(out_reg30), .out3(out_reg31));
    
        
    File_reg #(fix_bit, bits) FR0 (
        .clk(clk_20),
        .reset(reset),
        
        .in0(out_reg0),.in1(out_reg1),.in2(out_reg2),.in3(out_reg3),.in4(out_reg4),.in5(out_reg5),
        .in6(out_reg6),.in7(out_reg7),.in8(out_reg8),.in9(out_reg9),.in10(out_reg10),.in11(out_reg11),
        .in12(out_reg12),.in13(out_reg13),.in14(out_reg14),.in15(out_reg15),.in16(out_reg16),.in17(out_reg17),
        .in18(out_reg18),.in19(out_reg19),.in20(out_reg20),.in21(out_reg21),.in22(out_reg22),.in23(out_reg23),
        .in24(out_reg24),.in25(out_reg25),.in26(out_reg26),.in27(out_reg27),.in28(out_reg28),.in29(out_reg29),
        .in30(out_reg30),.in31(out_reg31),
        
        .out0(out0),.out1(out1),.out2(out2),.out3(out3),.out4(out4),.out5(out5),.out6(out6),.out7(out7),
        .out8(out8),.out9(out9),.out10(out10),.out11(out11),.out12(out12),.out13(out13),.out14(out14),
        .out15(out15),.out16(out16),.out17(out17),.out18(out18),.out19(out19),.out20(out20),.out21(out21),
        .out22(out22),.out23(out23),.out24(out24),.out25(out25),.out26(out26),.out27(out27),.out28(out28),
        .out29(out29),.out30(out30),.out31(out31)
        );
    
    
endmodule