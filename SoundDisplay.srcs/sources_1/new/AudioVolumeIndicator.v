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
    output reg [3:0] an,
    output reg [7:0] seg,
    output reg [4:0] led,
    output reg [15:0] oled_data,
    input [6:0] x,
    input [5:0] y
    );
    reg [11:0] peak = 0;
    reg [31:0]count = 0;
    always @(posedge clock_20k) begin
        count <= count+1;
        peak <= (peak > mic_in) ? peak: mic_in;
        if(count == 1000)
        begin
            an <= 4'b1110;
            if (peak <= 2048) begin // lvl 0
                seg <= 8'b11000000;
                led <= 5'b00000;
                oled_data <= 16'b0;
            end
            
            // oled is response when setting without conditions on x and y
            // 
            else if (peak > 2048 && peak <= 2458) begin // lvl 1
                seg <= 8'b11111001;
                led <= 5'b00001;
                if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                    oled_data <= 16'b1111100000000000;
                end 
                else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                    oled_data <= 16'b1111100000000000;
                end
                else if (x >= 43 && x <= 53) begin
                    if(y >= 45 && y <= 50) begin
                        oled_data <= 16'b1111100000000000; // R
                    end
                end
                else begin
                    oled_data <= 16'b0;
                end
            end
            else if (peak > 2458 && peak <= 2868) begin // lvl 2
                seg <= 8'b10100100;
                led <= 5'b00011;
            end
            else if (peak > 2868 && peak <= 3278) begin // lvl 3
                seg <= 8'b10110000;
                led <= 5'b00111;
            end
            else if (peak > 3278 && peak <= 3688) begin // lvl 4
                seg <= 8'b10011001;
                led <= 5'b01111;
            end
            else begin // lvl 5
                seg <= 8'b10010010;
                led <= 5'b11111;
            end
            peak <= 0;
            count <= 0;
        end      
    end   
endmodule
