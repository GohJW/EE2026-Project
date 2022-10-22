`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2022 16:53:54
// Design Name: 
// Module Name: TunerDisplay
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


module TunerDisplay(
    input [31:0] frequency,
    input clock_6p25m,
    output reg [15:0] oled_data
    );
    
    always@(posedge clock_6p25m) begin
        if(frequency >= 200 && frequency < 300) begin
            oled_data <= 16'b1111100000000000;
        end
        else if(frequency >= 300 && frequency < 400) begin
            oled_data <= 16'b0000011111100000;
        end
        else
            oled_data <= 16'b0000000000000000;
    end
endmodule
