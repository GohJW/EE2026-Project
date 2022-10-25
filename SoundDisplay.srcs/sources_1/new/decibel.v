`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2022 05:15:27
// Design Name: 
// Module Name: DecibelIndicator
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


module DecibelIndicator(
    input [11:0] Mic_in,
    input wire_clk20k,
    input [11:0] peak,
    output reg [31:0]decibel
    );
    
    reg[31:0] count = 0;
    always@(posedge wire_clk20k) begin
        count = (count == 2000) ? 0 : count+1;
        if(count == 2000) begin
        end
    end
    
endmodule
