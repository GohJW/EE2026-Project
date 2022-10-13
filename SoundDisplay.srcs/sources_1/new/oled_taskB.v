`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.10.2022 12:21:44
// Design Name: 
// Module Name: oled_taskB
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


module oled_taskB(
    input delay, wire_clk6p25m,
    output reg [15:0]oled_data_B,
    input [6:0] x,
    input [5:0] y
    );
    
     reg [2:0] state_B = 3'b000;
     always @ (posedge delay) begin
     state_B <= (state_B == 3'b111) ? 0: (state_B << 1) + 1;
     end
     
     always @(posedge wire_clk6p25m)
     begin
        if (x >= 43 && x <= 53) 
        begin
            if(y >= 45 && y <= 50) 
            begin
                oled_data_B <= 16'b1111100000000000; // R
            end
            else if(y >= 37 && y <= 42) 
            begin
                oled_data_B <= 16'hfc65;
            end
            else if (y >= 29 && y <= 34 && state_B[0] == 1)
            begin
                oled_data_B <= 16'h4ae5;
            end
            else if (y >= 21 && y <= 26 && state_B[1] == 1)
            begin
                oled_data_B <= 16'hc6b4;
            end
            else if (y >= 13 && y <= 18 && state_B[2] == 1)
            begin
                oled_data_B <= 16'hef9b;
            end
        end
        else
        begin
         oled_data_B <= 16'b0;
        end   
     end
        
endmodule
