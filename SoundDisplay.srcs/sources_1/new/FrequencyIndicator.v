`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 20:59:04
// Design Name: 
// Module Name: FrequencyIndicator
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


module FrequencyIndicator(
    input [11:0] MIC_in,
    input clk_20k,
    output reg cross = 0,
    output reg[31:0] frequency
    );
    reg[31:0] timer = 0;
    reg[31:0] count = 0;
    reg [31:0] multiply = 0;
    always@ (posedge clk_20k) begin
    multiply <= MIC_in * 2;
    timer <= (timer == 2000) ? 0:timer+1;
        if(multiply > 4200 && cross == 0) begin
            cross <= 1;
            count <= count + 1;
        end
        if(multiply < 4200 && cross == 1) begin
            cross <= 0;
        end
        if(timer == 2000) begin
            frequency <= count*10;
            count <= 0;
        end
    end    
endmodule
