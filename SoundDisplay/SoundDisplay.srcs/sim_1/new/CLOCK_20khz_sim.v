`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 14:33:02
// Design Name: 
// Module Name: CLOCK_20khz_sim
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


module CLOCK_20khz_sim(

    );
    reg CLOCK = 0;
    wire CLOCK_20khz;
    
    CLOCK_flexible unit20khz(CLOCK, CLOCK_20khz);
    always begin
    #5; CLOCK = ~CLOCK;
    end
endmodule
