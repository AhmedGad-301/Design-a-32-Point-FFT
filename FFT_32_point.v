`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 09:43:19 PM
// Design Name: 
// Module Name: FFT_32_point
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


module FFT_32_point #(parameter fix_bit = 7, parameter bits = 16)(
    input                       clk_100,
    input                       clk_20,
    input                       reset,
    input       [3:0]           enable,
    input       [1:0]           SEL,
    
    input       [(2*bits)-1:0]  in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,
                                in18,in19,in20,in21,in22,in23,in24,in25,in26,in27,in28,in29,in30,in31,
    
    output      [(2*bits)-1:0]  out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,
                                out15,out16,out17,out18,out19,out20,out21,out22,out23,out24,out25,out26,out27,
                                out28,out29,out30,out31
    );
    
    wire    [(2*bits)-1:0]  out_2P0,out_2P1,out_2P2,out_2P3,out_2P4,out_2P5,out_2P6,out_2P7,out_2P8,out_2P9;
    wire    [(2*bits)-1:0]  out_2P10,out_2P11,out_2P12,out_2P13,out_2P14,out_2P15,out_2P16,out_2P17,out_2P18;
    wire    [(2*bits)-1:0]  out_2P19,out_2P20,out_2P21,out_2P22,out_2P23,out_2P24,out_2P25,out_2P26,out_2P27;
    wire    [(2*bits)-1:0]  out_2P28,out_2P29,out_2P30,out_2P31;
    
    DFT_2_point #(fix_bit, bits) DF2 (
            .clk_100(clk_100),
            .clk_20(clk_20),
            .reset(reset),
            .enable(enable),
            .SEL(SEL),
            
            .in0(in0),.in1(in1),.in2(in2),.in3(in3),.in4(in4),.in5(in5),.in6(in6),.in7(in7),.in8(in8),
            .in9(in9),.in10(in10),.in11(in11),.in12(in12),.in13(in13),.in14(in14),.in15(in15),.in16(in16),
            .in17(in17),.in18(in18),.in19(in19),.in20(in20),.in21(in21),.in22(in22),.in23(in23),.in24(in24),
            .in25(in25),.in26(in26),.in27(in27),.in28(in28),.in29(in29),.in30(in30),.in31(in31),
            
            .out0(out_2P0),.out1(out_2P1),.out2(out_2P2),.out3(out_2P3),.out4(out_2P4),.out5(out_2P5),
            .out6(out_2P6),.out7(out_2P7),.out8(out_2P8),.out9(out_2P9),.out10(out_2P10),.out11(out_2P11),
            .out12(out_2P12),.out13(out_2P13),.out14(out_2P14),.out15(out_2P15),.out16(out_2P16),.out17(out_2P17),
            .out18(out_2P18),.out19(out_2P19),.out20(out_2P20),.out21(out_2P21),.out22(out_2P22),.out23(out_2P23),
            .out24(out_2P24),.out25(out_2P25),.out26(out_2P26),.out27(out_2P27),.out28(out_2P28),.out29(out_2P29),
            .out30(out_2P30),.out31(out_2P31)
            );
    
    wire    [(2*bits)-1:0]  out_4P0,out_4P1,out_4P2,out_4P3,out_4P4,out_4P5,out_4P6,out_4P7,out_4P8;
    wire    [(2*bits)-1:0]  out_4P9,out_4P10,out_4P11,out_4P12,out_4P13,out_4P14,out_4P15,out_4P16;
    wire    [(2*bits)-1:0]  out_4P17,out_4P18,out_4P19,out_4P20,out_4P21,out_4P22,out_4P23,out_4P24;
    wire    [(2*bits)-1:0]  out_4P25,out_4P26,out_4P27,out_4P28,out_4P29,out_4P30,out_4P31;
    
    DFT_4_point #(fix_bit, bits) DF4 (
            .clk_100(clk_100),
            .clk_20(clk_20),
            .reset(reset),
            .enable(enable),
            .SEL(SEL),
            
            .in0(out_2P0),.in1(out_2P1),.in2(out_2P2),.in3(out_2P3),.in4(out_2P4),.in5(out_2P5),
            .in6(out_2P6),.in7(out_2P7),.in8(out_2P8),.in9(out_2P9),.in10(out_2P10),.in11(out_2P11),
            .in12(out_2P12),.in13(out_2P13),.in14(out_2P14),.in15(out_2P15),.in16(out_2P16),.in17(out_2P17),
            .in18(out_2P18),.in19(out_2P19),.in20(out_2P20),.in21(out_2P21),.in22(out_2P22),.in23(out_2P23),
            .in24(out_2P24),.in25(out_2P25),.in26(out_2P26),.in27(out_2P27),.in28(out_2P28),.in29(out_2P29),
            .in30(out_2P30),.in31(out_2P31),
            
            .out0(out_4P0),.out1(out_4P1),.out2(out_4P2),.out3(out_4P3),.out4(out_4P4),.out5(out_4P5),
            .out6(out_4P6),.out7(out_4P7),.out8(out_4P8),.out9(out_4P9),.out10(out_4P10),.out11(out_4P11),
            .out12(out_4P12),.out13(out_4P13),.out14(out_4P14),.out15(out_4P15),.out16(out_4P16),.out17(out_4P17),
            .out18(out_4P18),.out19(out_4P19),.out20(out_4P20),.out21(out_4P21),.out22(out_4P22),.out23(out_4P23),
            .out24(out_4P24),.out25(out_4P25),.out26(out_4P26),.out27(out_4P27),.out28(out_4P28),.out29(out_4P29),
            .out30(out_4P30),.out31(out_4P31)
            );
    
    wire    [(2*bits)-1:0]  out_8P0,out_8P1,out_8P2,out_8P3,out_8P4,out_8P5,out_8P6,out_8P7,out_8P8;
    wire    [(2*bits)-1:0]  out_8P9,out_8P10,out_8P11,out_8P12,out_8P13,out_8P14,out_8P15,out_8P16;
    wire    [(2*bits)-1:0]  out_8P17,out_8P18,out_8P19,out_8P20,out_8P21,out_8P22,out_8P23,out_8P24;
    wire    [(2*bits)-1:0]  out_8P25,out_8P26,out_8P27,out_8P28,out_8P29,out_8P30,out_8P31;
    
    DFT_8_point #(fix_bit, bits) DF8 (
            .clk_100(clk_100),
            .clk_20(clk_20),
            .reset(reset),
            .enable(enable),
            .SEL(SEL),
            
            .in0(out_4P0),.in1(out_4P1),.in2(out_4P2),.in3(out_4P3),.in4(out_4P4),.in5(out_4P5),
            .in6(out_4P6),.in7(out_4P7),.in8(out_4P8),.in9(out_4P9),.in10(out_4P10),.in11(out_4P11),
            .in12(out_4P12),.in13(out_4P13),.in14(out_4P14),.in15(out_4P15),.in16(out_4P16),.in17(out_4P17),
            .in18(out_4P18),.in19(out_4P19),.in20(out_4P20),.in21(out_4P21),.in22(out_4P22),.in23(out_4P23),
            .in24(out_4P24),.in25(out_4P25),.in26(out_4P26),.in27(out_4P27),.in28(out_4P28),.in29(out_4P29),
            .in30(out_4P30),.in31(out_4P31),
            
            .out0(out_8P0),.out1(out_8P1),.out2(out_8P2),.out3(out_8P3),.out4(out_8P4),.out5(out_8P5),
            .out6(out_8P6),.out7(out_8P7),.out8(out_8P8),.out9(out_8P9),.out10(out_8P10),.out11(out_8P11),
            .out12(out_8P12),.out13(out_8P13),.out14(out_8P14),.out15(out_8P15),.out16(out_8P16),.out17(out_8P17),
            .out18(out_8P18),.out19(out_8P19),.out20(out_8P20),.out21(out_8P21),.out22(out_8P22),.out23(out_8P23),
            .out24(out_8P24),.out25(out_8P25),.out26(out_8P26),.out27(out_8P27),.out28(out_8P28),.out29(out_8P29),
            .out30(out_8P30),.out31(out_8P31)
            );
    
    wire    [(2*bits)-1:0]  out_16P0,out_16P1,out_16P2,out_16P3,out_16P4,out_16P5,out_16P6,out_16P7;
    wire    [(2*bits)-1:0]  out_16P8,out_16P9,out_16P10,out_16P11,out_16P12,out_16P13,out_16P14;
    wire    [(2*bits)-1:0]  out_16P15,out_16P16,out_16P17,out_16P18,out_16P19,out_16P20,out_16P21;
    wire    [(2*bits)-1:0]  out_16P22,out_16P23,out_16P24,out_16P25,out_16P26,out_16P27,out_16P28;
    wire    [(2*bits)-1:0]  out_16P29,out_16P30,out_16P31;
    
    DFT_16_point #(fix_bit, bits) DF16 (
            .clk_100(clk_100),
            .clk_20(clk_20),
            .reset(reset),
            .enable(enable),
            .SEL(SEL),
            
            .in0(out_8P0),.in1(out_8P1),.in2(out_8P2),.in3(out_8P3),.in4(out_8P4),.in5(out_8P5),.in6(out_8P6),
            .in7(out_8P7),.in8(out_8P8),.in9(out_8P9),.in10(out_8P10),.in11(out_8P11),.in12(out_8P12),
            .in13(out_8P13),.in14(out_8P14),.in15(out_8P15),.in16(out_8P16),.in17(out_8P17),.in18(out_8P18),
            .in19(out_8P19),.in20(out_8P20),.in21(out_8P21),.in22(out_8P22),.in23(out_8P23),.in24(out_8P24),
            .in25(out_8P25),.in26(out_8P26),.in27(out_8P27),.in28(out_8P28),.in29(out_8P29),.in30(out_8P30),
            .in31(out_8P31),
            
            .out0(out_16P0),.out1(out_16P1),.out2(out_16P2),.out3(out_16P3),.out4(out_16P4),.out5(out_16P5),
            .out6(out_16P6),.out7(out_16P7),.out8(out_16P8),.out9(out_16P9),.out10(out_16P10),.out11(out_16P11),
            .out12(out_16P12),.out13(out_16P13),.out14(out_16P14),.out15(out_16P15),.out16(out_16P16),.out17(out_16P17),
            .out18(out_16P18),.out19(out_16P19),.out20(out_16P20),.out21(out_16P21),.out22(out_16P22),.out23(out_16P23),
            .out24(out_16P24),.out25(out_16P25),.out26(out_16P26),.out27(out_16P27),.out28(out_16P28),.out29(out_16P29),
            .out30(out_16P30),.out31(out_16P31)
            );
    
    DFT_32_point #(fix_bit, bits) DF32 (
            .clk_100(clk_100),
            .clk_20(clk_20),
            .reset(reset),
            .enable(enable),
            .SEL(SEL),
            
            .in0(out_16P0),.in1(out_16P1),.in2(out_16P2),.in3(out_16P3),.in4(out_16P4),.in5(out_16P5),.in6(out_16P6),
            .in7(out_16P7),.in8(out_16P8),.in9(out_16P9),.in10(out_16P10),.in11(out_16P11),.in12(out_16P12),
            .in13(out_16P13),.in14(out_16P14),.in15(out_16P15),.in16(out_16P16),.in17(out_16P17),.in18(out_16P18),
            .in19(out_16P19),.in20(out_16P20),.in21(out_16P21),.in22(out_16P22),.in23(out_16P23),.in24(out_16P24),
            .in25(out_16P25),.in26(out_16P26),.in27(out_16P27),.in28(out_16P28),.in29(out_16P29),.in30(out_16P30),
            .in31(out_16P31),
            
            .out0(out0),.out1(out1),.out2(out2),.out3(out3),.out4(out4),.out5(out5),.out6(out6),.out7(out7),
            .out8(out8),.out9(out9),.out10(out10),.out11(out11),.out12(out12),.out13(out13),.out14(out14),
            .out15(out15),.out16(out16),.out17(out17),.out18(out18),.out19(out19),.out20(out20),.out21(out21),
            .out22(out22),.out23(out23),.out24(out24),.out25(out25),.out26(out26),.out27(out27),.out28(out28),
            .out29(out29),.out30(out30),.out31(out31)
            );
    
endmodule