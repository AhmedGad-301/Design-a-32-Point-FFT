`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2022 09:46:46 PM
// Design Name: 
// Module Name: MAX
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


module MUX #(parameter fix_bit = 7, parameter bits = 16)(
    input       [(2*bits)-1:0]  IN0,
    input       [(2*bits)-1:0]  IN1,
    input       [(2*bits)-1:0]  IN2,
    input       [(2*bits)-1:0]  IN3,
    input       [1:0]           SEL,
    output reg  [(2*bits)-1:0]  OUT
    );
    
    always @ (SEL or IN0 or IN1 or IN2 or IN3)
        begin
            case (SEL)
                2'b00: OUT = IN0;
                2'b01: OUT = IN1;
                2'b10: OUT = IN2;
                2'b11: OUT = IN3;
            endcase
        end
    
endmodule
