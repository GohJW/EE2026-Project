`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2022 21:15:52
// Design Name: 
// Module Name: AudioVolumeIndicator
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


module AudioVolumeIndicator(
    input [11:0] mic_in,
    input clock_20k,
    output reg [4:0] led
    );
    reg [11:0] peak = 0;
    reg [31:0]count = 0;
    always @(posedge clock_20k) begin
        count <= count+1;
        peak <= (peak > mic_in) ? peak: mic_in;
        if(count == 1000)
        begin
            if (peak <= 2048)
                led <= 5'b00000;
            if (peak > 2048 && peak <= 2458)
                led <= 5'b00001;
            if (peak > 2458 && peak <= 3868)
                led <= 5'b00011;
            if (peak > 2868 && peak <= 3278)
                led <= 5'b00111;
            if (peak > 3278 && peak <= 3688)
                led <= 5'b01111;
            if (peak > 3688)
                led <= 5'b11111;
            peak <= 0;
            count <= 0;
        end      
    end   
endmodule
