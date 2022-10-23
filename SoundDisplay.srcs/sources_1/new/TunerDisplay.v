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
    input[6:0] x,
    input[5:0] y,
    output reg [15:0] oled_data
    );
    
    always@(posedge clock_6p25m) begin
        if(frequency >= 254 && frequency < 269) begin
            if(((y > 23 && y < 25)||(y>49 && y<51)) && (x > 37 && x < 57)) // start of C
                oled_data <= 16'b1111111111111111;
            else if(((y == 25)||(y == 49)) && (x > 36 && x < 58))
                oled_data <= 16'b1111111111111111;
            else if(((y == 26) || (y == 48)) && (x > 36 && x < 59))
                oled_data <= 16'b1111111111111111;
            else if(((y > 26 && y < 29)||(y >45 && y<48)) && ((x >35 && x < 40) || (x>55 && x<59)))
                oled_data<= 16'b1111111111111111;
            else if((y > 28 && y < 46) && (x>35 && x<40))
                oled_data <=16'b1111111111111111; // end of C
            else
                oled_data<=16'b0000000000000000;
        end
        else if(frequency >= 300 && frequency < 400) begin
            oled_data <= 16'b0000011111100000;
        end
        else
            oled_data <= 16'b0000000000000000;
    end
endmodule
