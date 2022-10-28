`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 17:48:11
// Design Name: 
// Module Name: OLED_button
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


module OLED_button(
    input button,baysis_clock,
    input [31:0] countvalue,
    output reg delay = 0,
    output reg [1:0] state = 2'b00
    );
    reg [31:0] count = 0;
    reg [31:0] count2 = 0;
    reg press = 0;
    
    always @(posedge baysis_clock) begin
    if(button == 0 && delay == 0)
        press <= 0;
    if(button == 1 && delay == 0 && press == 0) begin
        delay <= 1;
        press <= 1;
        end
    if(delay == 1) begin
        count <= (count == countvalue) ? 0:count+1;
        delay <= (count == countvalue) ? 0: delay;
        end
    end
endmodule
