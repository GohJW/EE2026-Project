`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2022 18:30:47
// Design Name: 
// Module Name: OLED_button_test
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


module OLED_button_test(

    );
    reg button = 0;
    reg clock = 0;
    wire delay;
    
    OLED_button unittest(button, clock, 500, delay);
    
    always begin
    #5; clock = ~clock;
    end
    initial begin
    #10; button = 1; #10; button = 0;
    #50; button = 1; #10; button = 0;
    end
endmodule
