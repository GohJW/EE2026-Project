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
    input clock_6p25m,
    output reg [3:0] an,
    output reg [7:0] seg,
    output reg [4:0] led,
    output reg [15:0] oled_data,
    input [6:0] x,
    input [5:0] y
    );
    reg [11:0] peak = 0;
    reg [31:0]count = 0;
    always @ (posedge clock_20k) begin
       count <= count+1;
       peak <= (peak > mic_in) ? peak: mic_in;
        if(count == 2000) begin
            peak <= mic_in;
            count <= 0;
        end
    end
    always @(posedge clock_6p25m) begin 
      an <= 4'b1110;  
        if (peak <= 2070) begin // lvl 0
            seg <= 8'b11000000;
            led <= 5'b00000;
            oled_data <= 16'b0;
        end 
        if (peak > 2070 && peak <= 2170) begin // lvl 1
            seg <= 8'b11111001;
            led <= 5'b00001;
            if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else begin
                oled_data <= 16'b0;
            end
        end
        if (peak > 2170 && peak <= 2270) begin // lvl 2
            seg <= 8'b10100100;
            led <= 5'b00011;
            if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) begin //start of orange
                oled_data <= 16'b1111110100000000;
            end
            else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) begin //end of orange
                oled_data <= 16'b1111110100000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 37 && y <= 42)) begin // O
                oled_data <= 16'hfc65;
            end
            else begin
                oled_data <= 16'b0;
            end                
        end
        if (peak > 2270 && peak <= 2370) begin // lvl 3
            seg <= 8'b10110000;
            led <= 5'b00111;
            if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) begin //start of orange
                oled_data <= 16'b1111110100000000;
            end
            else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) begin //end of orange
                oled_data <= 16'b1111110100000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 37 && y <= 42)) begin // O
                oled_data <= 16'hfc65;
            end
            else if ((x == 9 || x == 86) && (y > 8 && y < 55)) begin //start of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 9 || y == 54) && (x > 8 && x < 87)) begin//end of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 29 && y <= 34)) begin
                oled_data <= 16'h4ae5;
            end
            else begin
                oled_data <= 16'b0;
            end
        end
        if (peak > 2370 && peak <= 2470) begin // lvl 4
            seg <= 8'b10011001;
            led <= 5'b01111;
            if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) begin //start of orange
                oled_data <= 16'b1111110100000000;
            end
            else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) begin //end of orange
                oled_data <= 16'b1111110100000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 37 && y <= 42)) begin // O
                oled_data <= 16'hfc65;
            end
            else if ((x == 9 || x == 86) && (y > 8 && y < 55)) begin //start of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 9 || y == 54) && (x > 8 && x < 87)) begin//end of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 29 && y <= 34)) begin
                oled_data <= 16'h4ae5;
            end
            else if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) begin //start of orange
                oled_data <= 16'b1111110100000000;
            end
            else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) begin //end of orange
                oled_data <= 16'b1111110100000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 37 && y <= 42)) begin // O
                oled_data <= 16'hfc65;
            end
            else if ((x == 9 || x == 86) && (y > 8 && y < 55)) begin //start of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 9 || y == 54) && (x > 8 && x < 87)) begin//end of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 29 && y <= 34)) begin
                oled_data <= 16'h4ae5;
            end
            else if ((x == 12 || x == 83) && (y > 11 && y < 52)) begin //start of green 2
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 12 || y == 51) && (x > 11 && x < 84)) begin//end of green 2
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 21 && y <= 26)) begin
                oled_data <= 16'hc6b4;
            end
            else begin
                oled_data <= 16'b0;
            end
        end
        if (peak > 2470) begin // lvl 5
            seg <= 8'b10010010;
            led <= 5'b11111;
            if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) begin //start of orange
                oled_data <= 16'b1111110100000000;
            end
            else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) begin //end of orange
                oled_data <= 16'b1111110100000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 37 && y <= 42)) begin // O
                oled_data <= 16'hfc65;
            end
            else if ((x == 9 || x == 86) && (y > 8 && y < 55)) begin //start of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 9 || y == 54) && (x > 8 && x < 87)) begin//end of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 29 && y <= 34)) begin
                oled_data <= 16'h4ae5;
            end
            else if((x == 2 || x == 93) && (y > 1 && y < 62)) begin // start of red
                oled_data <= 16'b1111100000000000;
            end 
            else if((y == 2 || y == 61) && (x > 1 && x < 94)) begin //end of red
                oled_data <= 16'b1111100000000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 45 && y <= 50)) begin
                    oled_data <= 16'b1111100000000000; // R
            end
            else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) begin //start of orange
                oled_data <= 16'b1111110100000000;
            end
            else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) begin //end of orange
                oled_data <= 16'b1111110100000000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 37 && y <= 42)) begin // O
                oled_data <= 16'hfc65;
            end
            else if ((x == 9 || x == 86) && (y > 8 && y < 55)) begin //start of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 9 || y == 54) && (x > 8 && x < 87)) begin//end of green 1
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 29 && y <= 34)) begin
                oled_data <= 16'h4ae5;
            end
            else if ((x == 12 || x == 83) && (y > 11 && y < 52)) begin //start of green 2
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 12 || y == 51) && (x > 11 && x < 84)) begin//end of green 2
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 21 && y <= 26)) begin
                oled_data <= 16'hc6b4;
            end
            else if ((x == 15 || x == 80) && (y > 14 && y < 49)) begin //start of green 3
                 oled_data <= 16'b0000011111100000;
            end
            else if ((y == 15 || y == 48) && (x > 14 && x < 81)) begin//end of green 3
                 oled_data <= 16'b0000011111100000;
            end
            else if ((x >= 43 && x <= 53) && (y >= 13 && y <= 18)) begin
                oled_data <= 16'hef9b;
            end
            else begin
                oled_data <= 16'b0;
            end
       end
    end   
endmodule
