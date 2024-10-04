`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2022 10:04:10 PM
// Design Name: 
// Module Name: Con_In
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


module Con_In #(parameter fix_bit = 7, parameter bits = 16)(
    input       [7:0]  in00,
    input       [7:0]  in01,
    input       [7:0]  in02,
    input       [7:0]  in03,
    input       [7:0]  in04,
    input       [7:0]  in05,
    input       [7:0]  in06,
    input       [7:0]  in07,
    input       [7:0]  in08,
    input       [7:0]  in09,
    input       [7:0]  in010,
    input       [7:0]  in011,
    input       [7:0]  in012,
    input       [7:0]  in013,
    input       [7:0]  in014,
    input       [7:0]  in015,
    input       [7:0]  in016,
    input       [7:0]  in017,
    input       [7:0]  in018,
    input       [7:0]  in019,
    input       [7:0]  in020,
    input       [7:0]  in021,
    input       [7:0]  in022,
    input       [7:0]  in023,
    input       [7:0]  in024,
    input       [7:0]  in025,
    input       [7:0]  in026,
    input       [7:0]  in027,
    input       [7:0]  in028,
    input       [7:0]  in029,
    input       [7:0]  in030,
    input       [7:0]  in031,
    
    output       [(2*bits)-1:0]  out0,
    output       [(2*bits)-1:0]  out1,
    output       [(2*bits)-1:0]  out2,
    output       [(2*bits)-1:0]  out3,
    output       [(2*bits)-1:0]  out4,
    output       [(2*bits)-1:0]  out5,
    output       [(2*bits)-1:0]  out6,
    output       [(2*bits)-1:0]  out7,
    output       [(2*bits)-1:0]  out8,
    output       [(2*bits)-1:0]  out9,
    output       [(2*bits)-1:0]  out10,
    output       [(2*bits)-1:0]  out11,
    output       [(2*bits)-1:0]  out12,
    output       [(2*bits)-1:0]  out13,
    output       [(2*bits)-1:0]  out14,
    output       [(2*bits)-1:0]  out15,
    output       [(2*bits)-1:0]  out16,
    output       [(2*bits)-1:0]  out17,
    output       [(2*bits)-1:0]  out18,
    output       [(2*bits)-1:0]  out19,
    output       [(2*bits)-1:0]  out20,
    output       [(2*bits)-1:0]  out21,
    output       [(2*bits)-1:0]  out22,
    output       [(2*bits)-1:0]  out23,
    output       [(2*bits)-1:0]  out24,
    output       [(2*bits)-1:0]  out25,
    output       [(2*bits)-1:0]  out26,
    output       [(2*bits)-1:0]  out27,
    output       [(2*bits)-1:0]  out28,
    output       [(2*bits)-1:0]  out29,
    output       [(2*bits)-1:0]  out30,
    output       [(2*bits)-1:0]  out31
    );
    
    assign out0 = {{bits+1{1'b0}},in00,{fix_bit{1'b0}}};
    assign out1 = {{bits+1{1'b0}},in01,{fix_bit{1'b0}}};
    assign out2 = {{bits+1{1'b0}},in02,{fix_bit{1'b0}}};
    assign out3 = {{bits+1{1'b0}},in03,{fix_bit{1'b0}}};
    assign out4 = {{bits+1{1'b0}},in04,{fix_bit{1'b0}}};
    assign out5 = {{bits+1{1'b0}},in05,{fix_bit{1'b0}}};
    assign out6 = {{bits+1{1'b0}},in06,{fix_bit{1'b0}}};
    assign out7 = {{bits+1{1'b0}},in07,{fix_bit{1'b0}}};
    assign out8 = {{bits+1{1'b0}},in08,{fix_bit{1'b0}}};
    assign out9 = {{bits+1{1'b0}},in09,{fix_bit{1'b0}}};
    assign out10 = {{bits+1{1'b0}},in010,{fix_bit{1'b0}}};
    assign out11 = {{bits+1{1'b0}},in011,{fix_bit{1'b0}}};
    assign out12 = {{bits+1{1'b0}},in012,{fix_bit{1'b0}}};
    assign out13 = {{bits+1{1'b0}},in013,{fix_bit{1'b0}}};
    assign out14 = {{bits+1{1'b0}},in014,{fix_bit{1'b0}}};
    assign out15 = {{bits+1{1'b0}},in015,{fix_bit{1'b0}}};
    assign out16 = {{bits+1{1'b0}},in016,{fix_bit{1'b0}}};
    assign out17 = {{bits+1{1'b0}},in017,{fix_bit{1'b0}}};
    assign out18 = {{bits+1{1'b0}},in018,{fix_bit{1'b0}}};
    assign out19 = {{bits+1{1'b0}},in019,{fix_bit{1'b0}}};
    assign out20 = {{bits+1{1'b0}},in020,{fix_bit{1'b0}}};
    assign out21 = {{bits+1{1'b0}},in021,{fix_bit{1'b0}}};
    assign out22 = {{bits+1{1'b0}},in022,{fix_bit{1'b0}}};
    assign out23 = {{bits+1{1'b0}},in023,{fix_bit{1'b0}}};
    assign out24 = {{bits+1{1'b0}},in024,{fix_bit{1'b0}}};
    assign out25 = {{bits+1{1'b0}},in025,{fix_bit{1'b0}}};
    assign out26 = {{bits+1{1'b0}},in026,{fix_bit{1'b0}}};
    assign out27 = {{bits+1{1'b0}},in027,{fix_bit{1'b0}}};
    assign out28 = {{bits+1{1'b0}},in028,{fix_bit{1'b0}}};
    assign out29 = {{bits+1{1'b0}},in029,{fix_bit{1'b0}}};
    assign out30 = {{bits+1{1'b0}},in030,{fix_bit{1'b0}}};
    assign out31 = {{bits+1{1'b0}},in031,{fix_bit{1'b0}}};
    
    
endmodule
