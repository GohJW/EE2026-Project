`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 15:17:42
// Design Name: 
// Module Name: freq_display
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


module seg_display(
    input clock,
    input [13:0] display,
    output reg [3:0] an,
    output reg [7:0] seg
    );
    
    reg[3:0] LED_BCD = 0;
    reg[1:0] refresh_counter = 0;
    
    always @(posedge clock) begin
        refresh_counter <= (refresh_counter == 3) ? 0 : refresh_counter + 1;
    end
    
    always @(refresh_counter)
    begin
        case(refresh_counter)
            2'b00: begin
                an = 4'b1110; // rightmost
                LED_BCD <= display%10;
            end
            2'b01: begin
                an = 4'b1101;
                LED_BCD <= (display/10)%10;
            end
            2'b10: begin
                an = 4'b1011;
                LED_BCD <= (display/100)%10;
            end
            2'b11: begin
                an = 4'b0111; // leftmost
                LED_BCD <= display/1000;
            end
        endcase
    end
    
    always@(*)
    begin
        case(LED_BCD)
            4'b0000: seg = 8'b11000000; // "0"  
            4'b0001: seg = 8'b11111001; // "1" 
            4'b0010: seg = 8'b10100100; // "2" 
            4'b0011: seg = 8'b10110000; // "3" 
            4'b0100: seg = 8'b10011001; // "4" 
            4'b0101: seg = 8'b10010010; // "5" 
            4'b0110: seg = 8'b10000010; // "6" 
            4'b0111: seg = 8'b11111000; // "7" 
            4'b1000: seg = 8'b10000000; // "8"  
            4'b1001: seg = 8'b10010000; // "9" 
            default: seg = 8'b11000000; // "0"
       endcase
    end

    
endmodule
