`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2022 15:43:18
// Design Name: 
// Module Name: MenuModule
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


module MenuModule(
    input clk_6p25m,
    input btnU, btnD, btnL, btnR, btnC,
    input [6:0] x,
    input [5:0] y,
    output reg [2:0] menustate,
    output reg [15:0] oled_data 
    );
    reg press = 0;
    reg delay = 0;
    reg [31:0] count = 0;
    always @ (posedge clk_6p25m) begin
        if(delay == 1) begin
            count <= (count == 625000) ? 0: count+1;
            delay <= (count == 625000) ? 0:1;
        end
        if((btnU == 1 ||btnD == 1 || btnL == 1 || btnR == 1 || btnC == 1) && delay == 0) begin
            press = 1;
            delay <= 1;
        end
        if(btnU == 0 && btnD == 0 && btnL == 0 && btnR == 0 && btnC == 0 && delay == 0 && press == 1)
            press <= 0;
        case(menustate)
            3'b000: begin // B
                if(x > 46 && y < 31)
                    oled_data <= 16'b1111111111111111;
                else
                    oled_data <= 16'b0000000000000000;
            end
            3'b001: begin //freq
                if(x > 46 && y > 30)
                    oled_data <= 16'b1111111111111111;
                else
                    oled_data <= 16'b0000000000000000;
            end
            3'b010: begin // A
                if(x < 47 && y < 31)
                    oled_data <= 16'b1111111111111111;
                else
                    oled_data <= 16'b0000000000000000;
            end
            3'b011: begin //AV
                if(x < 47 && y > 30)
                    oled_data <= 16'b1111111111111111;
                else
                    oled_data <= 16'b0000000000000000;
            end
        endcase
    end
    always @ (posedge delay) begin
        if((btnU == 1 || btnD == 1) && menustate[2] == 0) begin
                menustate[0] <= ~menustate[0];
            end
            if((btnL == 1 || btnR == 1) && menustate[2] == 0) begin
                menustate[1] <= ~menustate[1];
            end
            if(btnC == 1) begin
                menustate[2] <= ~menustate[2];
            end
    end
endmodule
