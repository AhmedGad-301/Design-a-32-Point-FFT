`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 10:08:33 PM
// Design Name: 
// Module Name: TOP
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


module TOP #(parameter fix_bit = 7, parameter bits = 16)(
    input                       clk_100,
    input                       clk_20,
    input                       reset,
    
    input       [7:0]           in08,in18,in28,in38,in48,in58,in68,in78,in88,in98,in108,in118,in128,in138,
                                in148,in158,in168,in178,in188,in198,in208,in218,in228,in238,in248,in258,in268,
                                in278,in288,in298,in308,in318,
    
    output   [(2*bits)-1:0]     out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,
                                out14,out15,out16,out17,out18,out19,out20,out21,out22,out23,out24,out25,
                                out26,out27,out28,out29,out30,out31
    );
    
    wire    [3:0]   enable;
    wire    [1:0]   SEL;
    
    Control_unit CU (
    .clk_100(clk_100),
    .reset(reset),
    .enable(enable),
    .SEL(SEL)
    );
    
    wire   [(2*bits)-1:0]   outr0,outr1,outr2,outr3,outr4,outr5,outr6,outr7,outr8,outr9,outr10,outr11,outr12,outr13,outr14,outr15,outr16,outr17;
    wire   [(2*bits)-1:0]   outr18,outr19,outr20,outr21,outr22,outr23,outr24,outr25,outr26,outr27,outr28,outr29,outr30,outr31;
    
    Con_In #(fix_bit, bits) CI (
    .in00(in08),.in01(in18),.in02(in28),.in03(in38),.in04(in48),.in05(in58),.in06(in68),.in07(in78),
    .in08(in88),.in09(in98),.in010(in108),.in011(in118),.in012(in128),.in013(in138),.in014(in148),
    .in015(in158),.in016(in168),.in017(in178),.in018(in188),.in019(in198),.in020(in208),.in021(in218),
    .in022(in228),.in023(in238),.in024(in248),.in025(in258),.in026(in268),.in027(in278),.in028(in288),
    .in029(in298),.in030(in308),.in031(in318),
    
    .out0(outr0),.out1(outr1),.out2(outr2),.out3(outr3),.out4(outr4),.out5(outr5),.out6(outr6),.out7(outr7),
    .out8(outr8),.out9(outr9),.out10(outr10),.out11(outr11),.out12(outr12),.out13(outr13),.out14(outr14),
    .out15(outr15),.out16(outr16),.out17(outr17),.out18(outr18),.out19(outr19),.out20(outr20),.out21(outr21),
    .out22(outr22),.out23(outr23),.out24(outr24),.out25(outr25),.out26(outr26),.out27(outr27),.out28(outr28),
    .out29(outr29),.out30(outr30),.out31(outr31)
    );
    
    FFT_32_point #(fix_bit, bits) FP(
    .clk_100(clk_100),
    .clk_20(clk_20),
    .reset(reset),
    .enable(enable),
    .SEL(SEL),
    
    .in0(outr0),.in1(outr1),.in2(outr2),.in3(outr3),.in4(outr4),.in5(outr5),.in6(outr6),.in7(outr7),
    .in8(outr8),.in9(outr9),.in10(outr10),.in11(outr11),.in12(outr12),.in13(outr13),.in14(outr14),
    .in15(outr15),.in16(outr16),.in17(outr17),.in18(outr18),.in19(outr19),.in20(outr20),.in21(outr21),
    .in22(outr22),.in23(outr23),.in24(outr24),.in25(outr25),.in26(outr26),.in27(outr27),.in28(outr28),
    .in29(outr29),.in30(outr30),.in31(outr31),
    
    .out0(out0),.out1(out1),.out2(out2),.out3(out3),.out4(out4),.out5(out5),.out6(out6),.out7(out7),
    .out8(out8),.out9(out9),.out10(out10),.out11(out11),.out12(out12),.out13(out13),.out14(out14),
    .out15(out15),.out16(out16),.out17(out17),.out18(out18),.out19(out19),.out20(out20),.out21(out21),
    .out22(out22),.out23(out23),.out24(out24),.out25(out25),.out26(out26),.out27(out27),.out28(out28),
    .out29(out29),.out30(out30),.out31(out31)
    );
    
endmodule
