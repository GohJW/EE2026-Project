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
        if(frequency >= 259 && frequency <= 263) begin // C4 in tune
            // pointer
            if ( x == 47 && x == 48 && y >= 9 && y <= 24 ) begin
                oled_data <= 16'b0000011111100000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 35 && y <= 54) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && y == 36 && y == 37 && y == 52 && y == 53 ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( x == 34 && x == 35 && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( x == 36 && x == 37 && y == 53  && y == 54 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 38 && x == 39 && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && y == 53 && y == 54) begin
                oled_data <=16'b1111111111111111; end   
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if(frequency >= 253 && frequency <= 259) begin // C4 flat
            // pointer
            if ( x == 21 && x == 22 && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( x == 23 && x == 24 && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( x == 25 && x == 26 && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( x == 27 && x == 28 && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( x == 29 && x == 30 && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 35 && y <= 54) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && y == 36 && y == 37 && y == 52 && y == 53 ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( x == 34 && x == 35 && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( x == 36 && x == 37 && y == 53  && y == 54 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 38 && x == 39 && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && y == 53 && y == 54) begin
                oled_data <=16'b1111111111111111; end   
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 264 && frequency <= 269 ) begin
            // pointer
            if ( x == 74 && x == 75 && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( x == 72 && x == 73 && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( x == 70 && x == 71 && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( x == 68 && x == 69 && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( x == 66 && x == 67 && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 35 && y <= 54) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && y == 36 && y == 37 && y == 52 && y == 53 ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( x == 34 && x == 35 && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( x == 36 && x == 37 && y == 53  && y == 54 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 38 && x == 39 && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && y == 53 && y == 54) begin
                oled_data <=16'b1111111111111111; end   
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else
            oled_data <= 16'b0000000000011111;
    end
endmodule
