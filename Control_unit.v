`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2022 12:06:03 AM
// Design Name: 
// Module Name: Control_unit
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


module Control_unit(
    input           clk_100,
    input           reset,
    
    output  [3:0]   enable,
    output  [1:0]   SEL
    );
    
    reg     [1:0]   counter = 0;
    reg             flag = 1;
    reg             flag2 = 0;
    
    assign SEL = counter;
    assign enable[0] = !(SEL[1]  |   SEL[0]);
    assign enable[1] = (!SEL[1]) &   SEL[0];
    assign enable[2] =   SEL[1]  & (!SEL[0]);
    assign enable[3] =   SEL[1]  &   SEL[0];
    
    always @ (negedge clk_100)
        begin
            if (flag)
                begin
                    flag = 0;
                end
        end
    
    always @ (posedge clk_100, posedge reset)
        begin
            if (reset)
                begin
                    counter = 0;
                end
            else
                begin
                    if(flag)
                        begin
                            counter = 0;
                        end
                    else if(flag2)
                        begin
                            counter = 3;
                            if(counter == 2'b11)
                                begin
                                    flag2 = 0;
                                end
                        end
                    else
                        begin
                            counter = counter + 1;
                            if(counter == 2'b11)
                                begin
                                    flag2 = 1;
                                end
                        end
                end
        end
    
    
endmodule
