`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 12:00:16
// Design Name: 
// Module Name: oled_taskA
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


module oled_taskA(
    input delay, wire_clk6p25m,
    output reg [15:0]oled_data_A,
    input [6:0] x,
    input [5:0] y
    );
    
     reg [3:0] state_A = 4'b0000;
     always @(posedge delay) begin
        state_A <= (state_A == 4'b1111) ? 0 : (state_A << 1) + 1;
     end
     always @(posedge wire_clk6p25m) begin
     if((x == 2 || x == 93) && (y > 1 && y < 62)) // start of red
        begin
        oled_data_A <= 16'b1111100000000000;
        end 
     else if((y == 2 || y == 61) && (x > 1 && x < 94)) //end of red
        begin
        oled_data_A <= 16'b1111100000000000;
        end
     else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) //start of orange
        begin
        oled_data_A <= 16'b1111110100000000;
        end
     else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) //end of orange
        begin
        oled_data_A <= 16'b1111110100000000;
        end
     else if ((x == 9 || x == 86) && (y > 8 && y < 55) && state_A[0] == 1) //start of green 1
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else if ((y == 9 || y == 54) && (x > 8 && x < 87) && state_A[0] == 1)//end of green 1
     begin
     oled_data_A <= 16'b0000011111100000;
     end 
     else if ((x == 12 || x == 83) && (y > 11 && y < 52) && state_A[1] == 1) //start of green 2
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else if ((y == 12 || y == 51) && (x > 11 && x < 84) && state_A[1] == 1)//end of green 2
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else if ((x == 15 || x == 80) && (y > 14 && y < 49) && state_A[2] == 1) //start of green 3
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else if ((y == 15 || y == 48) && (x > 14 && x < 81) && state_A[2] == 1)//end of green 3
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else if ((x == 18 || x == 77) && (y > 17 && y < 46) && state_A[3] == 1) //start of green 4
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else if ((y == 18 || y == 45) && (x > 17 && x < 78) && state_A[3] == 1)//end of green 4
     begin
     oled_data_A <= 16'b0000011111100000;
     end
     else //default to black
        begin
        oled_data_A <= 16'b0000000000000000;
        end
     end
     
    
endmodule
