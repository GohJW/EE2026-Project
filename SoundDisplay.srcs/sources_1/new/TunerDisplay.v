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
        if (frequency < 253) begin
            oled_data <= 16'b0000011111100000;
        end
        else if(frequency >= 253 && frequency <= 258) begin // C4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end 
            else begin
                oled_data<=16'b0000000000000000; end
        end        
        else if(frequency >= 259 && frequency <= 263) begin // C4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 50 && x <= 52 &&(y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end 
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 264 && frequency <= 269 ) begin // C4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
//            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
//            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53  || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end   
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 270 && frequency <= 274) begin // C#4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end 
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 275 && frequency <= 280) begin // C#4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 50 && x <= 52 &&(y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end 
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 281 && frequency <= 285) begin // C#4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin 
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end 
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 286 && frequency <= 290) begin // D4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end    
        end
        else if (frequency >= 291 && frequency <= 295 ) begin // D4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || x == 50 || x == 51 || x == 52) && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
             // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 296 && frequency <= 301) begin // D4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter D
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end   
        end
        else if ( frequency >= 302 && frequency <= 307) begin // Eb4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 308 && frequency <= 313 ) begin // Eb4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 314 && frequency <= 320 ) begin // E4b sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 321 && frequency <= 325) begin // E4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 326 && frequency <= 332) begin // E4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 333 && frequency <= 339 ) begin // E4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 340 && frequency <= 345) begin //F4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter F
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 346 && frequency <= 353) begin // F4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 354 && frequency <= 360) begin // F4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 361 && frequency <= 365) begin // F#4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter F
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 366 && frequency <= 374) begin // F4# in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 375 && frequency <= 381) begin // F4# sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 382 && frequency < 388) begin // G4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 49) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 389 && frequency <= 395) begin // G4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 396 && frequency <= 404) begin // G4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 49) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 405 && frequency <= 412) begin // Ab4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 413 && frequency <= 418) begin // Ab4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 45 || y == 46)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 419 && frequency <= 427) begin // Ab4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 428 && frequency <= 437) begin // A4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 438 && frequency <= 442) begin // A4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 45 || y == 46)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 443 && frequency <= 452) begin // A4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 453 && frequency <= 463) begin // Bb4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 464 && frequency <= 468) begin //Bb4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || (x >= 50 && x <= 52)) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 469 && frequency <= 479) begin // Bb4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 480 && frequency <= 490) begin // B4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 491 && frequency <= 495) begin // B4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || (x >= 50 && x <= 52)) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 496 && frequency <= 507) begin // B4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 4
            else if( (x == 34 || x == 35) && y >= 47 && y <= 54 ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37) && (y == 53 || y == 54) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 38 || x == 39) && y >= 47 && y <= 57 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 40 && (y == 53 || y == 54)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        
// HIGHER OCTAVE
        
        if(frequency >= 508 && frequency <= 520) begin // C4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end        
        else if(frequency >= 521 && frequency <= 525) begin // C4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 50 && x <= 52 &&(y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 526 && frequency <= 538 ) begin // C4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
//            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 539 && frequency <= 551) begin // C#4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 552 && frequency <= 556) begin // C#4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 50 && x <= 52 &&(y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 557 && frequency <= 570) begin // C#4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin 
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 571 && frequency <= 584) begin // D4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end  
        end
        else if (frequency >= 585 && frequency <= 589 ) begin // D4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || x == 50 || x == 51 || x == 52) && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 590 && frequency <= 604) begin // D4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter D
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end   
        end
        else if ( frequency >= 605 && frequency <= 619) begin // Eb4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 620 && frequency <= 624 ) begin // Eb4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 625 && frequency <= 640 ) begin // E4b sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 641 && frequency <= 656) begin // E4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 657 && frequency <= 661) begin // E4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 662 && frequency <= 678 ) begin // E4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 679 && frequency <= 695) begin //F4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter F
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 696 && frequency <= 700) begin // F4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 701 && frequency <= 718) begin // F4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 719 && frequency <= 736) begin // F#4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter F
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 737 && frequency <= 741) begin // F4# in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 742 && frequency <= 761) begin // F4# sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 762 && frequency < 780) begin // G4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 49) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 781 && frequency <= 785) begin // G4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 786 && frequency <= 806) begin // G4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 49) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 807 && frequency <= 827) begin // Ab4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 828 && frequency <= 832) begin // Ab4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 45 || y == 46)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 833 && frequency <= 855) begin // Ab4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 856 && frequency <= 877) begin // A4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 878 && frequency <= 882) begin // A4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 45 || y == 46)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 883 && frequency <= 906) begin // A4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 907 && frequency <= 929) begin // Bb4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 930 && frequency <= 934) begin //Bb4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || (x >= 50 && x <= 52)) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 935 && frequency <= 959) begin // Bb4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 960 && frequency <= 984) begin // B4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 985 && frequency <= 989) begin // B4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || (x >= 50 && x <= 52)) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 990 && frequency <= 1016) begin // B4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 5
            else if( (x == 34 || x == 35) && ((y >= 47 && y <= 52) || y == 56 || y == 57) ) begin
                oled_data<= 16'b1111111111111111; end
            else if( (x == 36 || x == 37 || x == 38) && (y == 47 || y == 48 || y == 52 || y == 56 || y == 57) ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 39 || x == 40) && (y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        
// HIGHER OCTAVE
        
        else if(frequency >= 1017 && frequency <= 1043) begin // C4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end        
        else if(frequency >= 1044 && frequency <= 1048) begin // C4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 50 && x <= 52 &&(y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1049 && frequency <= 1077 ) begin // C4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
        //            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1078 && frequency <= 1105) begin // C#4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1106 && frequency <= 1110) begin // C#4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of C
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 50 && x <= 52 &&(y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1111 && frequency <= 1141) begin // C#4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if( x == 43 && y >= 39 && y <= 50 ) begin 
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 52) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 50 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 50 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1142 && frequency <= 1171) begin // D4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end 
        end
        else if (frequency >= 1172 && frequency <= 1176 ) begin // D4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || x == 50 || x == 51 || x == 52) && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1177 && frequency <= 1209) begin // D4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter D
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53) begin 
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && y >= 37 && y <= 52 ) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end  
        end
        else if ( frequency >= 1210 && frequency <= 1241) begin // Eb4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1242 && frequency <= 1246 ) begin // Eb4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1247 && frequency <= 1276 ) begin // E4b sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1277 && frequency <= 1315) begin // E4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1316 && frequency <= 1320) begin // E4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1321 && frequency <= 1357 ) begin // E4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1358 && frequency <= 1393) begin //F4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter F
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1394 && frequency <= 1398) begin // F4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1399 && frequency <= 1437) begin // F4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1438 && frequency <= 1476) begin // F#4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter F
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1477 && frequency <= 1481) begin // F4# in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || ( x >= 50 && x <= 54))  && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
             // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1482 && frequency <= 1523) begin // F4# sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter E
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 54 && ( y == 36 || y == 37 || y == 44 || y == 45)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // #
            else if ( (x == 57 || x == 58 || x == 60 || x == 61 || x == 63 || x == 64) && ( y == 33 || y == 36)) begin
                oled_data <=16'b1111111111111111; end
            else if ( ( x == 59 || x == 62) && (y >= 30 && y <= 40)) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1524 && frequency <= 1564) begin // G4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 49) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1565 && frequency <= 1569) begin // G4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x == 46 || x == 47) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1570 && frequency <= 1614) begin // G4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter G
            else if( x == 43 && y >= 39 && y <= 50 ) begin // start of G
                oled_data <= 16'b1111111111111111; end
            else if( x == 44 && y >= 37 && y <= 52) begin
                oled_data <= 16'b1111111111111111; end
            else if( x == 45 && y >= 36 && y <= 53) begin
                oled_data <= 16'b1111111111111111; end
            else if ( (x >= 46 && x <= 49) && (y == 36 || y == 37 || y == 52 || y == 53) ) begin 
                oled_data <= 16'b1111111111111111; end
            else if ( ( x >= 50 && x <= 52) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 53 && ((y >= 36 && y <= 39) || ( y >= 44 && y <= 53 ))) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x == 54 && ((y >= 37 && y <= 39) || ( y >= 44 && y <= 52))) begin
                oled_data <= 16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1615 && frequency <= 1658) begin // Ab4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1659 && frequency <= 1663) begin // Ab4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 45 || y == 46)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1664 && frequency <= 1710) begin // Ab4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1711 && frequency <= 1757) begin // A4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1758 && frequency <= 1762) begin // A4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 45 || y == 46)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if ( frequency >= 1763 && frequency <= 1812) begin // A4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter A
            else if ( (x == 43 || x == 54) && y >= 39 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 44 || x == 53 ) && y >= 37 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 45 || x == 52)  && y >= 36 && y <= 53) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 51 && ( y == 36 || y == 37 || y == 45 || y == 46)) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1813 && frequency <= 1861) begin // Bb4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1862 && frequency <= 1866) begin //Bb4 in tune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || (x >= 50 && x <= 52)) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1867 && frequency <= 1919) begin // Bb4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            // b
            else if ( x == 59 && y >= 30 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 60 && x <= 63 && ( y == 35 || y == 36 || y == 39 || y == 40)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 64 && y >= 35 && y <= 40) begin
                oled_data <=16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1920 && frequency <= 1972) begin // B4 flat
            // pointer
            if ( (x == 21 || x == 22) && (y >= 9 && y <= 11) ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 23 || x == 24) && (y >= 12 && y <= 14) )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 25 || x == 26) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 27 || x == 28) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 29 || x == 30) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1973 && frequency <= 1977) begin // B4 intune
            // pointer
            if ( x == 48 || x == 49) begin
                if (y >= 9 && y <= 24) begin
                    oled_data <= 16'b0000011111100000; end
                else if ((y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                    oled_data <= 16'b1111111111111111; end end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( (x == 46 || x == 47 || (x >= 50 && x <= 52)) && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else if (frequency >= 1978 && frequency <= 2034) begin // B4 sharp
            // pointer
            if ( (x == 74 || x == 75) && y >= 9 && y <= 11 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 72 || x == 73) && y >= 12 && y <= 14 )begin
                oled_data <=16'b1111100000000000; end
            else if ( (x == 70 || x == 71) && y >= 15 && y <= 17 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 68 || x == 69) && y >= 18 && y <= 20 ) begin
                oled_data <=16'b1111100000000000; end 
            else if ( (x == 66 || x == 67) && y >= 21 && y <= 23) begin
                oled_data <=16'b1111100000000000; end
            // letter B
            else if ( x >= 43 && x <= 45 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x >= 46 && x <= 52 && ( y == 36 || y == 37 || y == 44 || y == 45 || y == 52 || y == 53)) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 53 && y >= 36 && y <= 53 ) begin
                oled_data <=16'b1111111111111111; end
            else if ( x == 54 && ( ( y >= 37 && y <= 43) || ( y >= 46 && y <= 52))) begin
                oled_data <=16'b1111111111111111; end
            // number 6
            else if ( (x == 34 || x == 35) && y >= 47 && y <= 57) begin
                oled_data <= 16'b1111111111111111; end
            else if ( x >= 36 && x <= 38 && ( y == 47 || y == 48 || y == 52 || y == 53 || y == 56 || y == 57)) begin
                oled_data <= 16'b1111111111111111; end
            else if ( ( x == 39 || x == 40 ) && ( y == 47 || y == 48 || ( y >= 52 && y <= 57))) begin
                oled_data <= 16'b1111111111111111; end
            else begin
                oled_data<=16'b0000000000000000; end
        end
        else 
            oled_data <= 16'b0000000000011111;
    end
endmodule