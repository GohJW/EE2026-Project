`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 14:28:14
// Design Name: 
// Module Name: CLOCK_20khz
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


module CLOCK_flexible(
    input CLOCK,
    input [31:0] COUNT_VALUE,
    output reg CLOCK_flex = 0
    );
    reg [31:0] COUNT = 0;
    
    always @(posedge CLOCK) begin
    COUNT <= (COUNT == COUNT_VALUE) ? 0: COUNT + 1;
    CLOCK_flex = (COUNT == COUNT_VALUE) ? ~CLOCK_flex:CLOCK_flex;
    end
endmodule
