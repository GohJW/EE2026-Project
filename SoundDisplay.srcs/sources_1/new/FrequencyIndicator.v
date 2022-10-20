`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2022 20:59:04
// Design Name: 
// Module Name: FrequencyIndicator
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


module FrequencyIndicator(
    input [11:0] MIC_in,
    input clk_20k,
    output reg cross = 0,
    output reg[31:0] frequency
    );
    reg[31:0] timer = 0;
    reg[31:0] count = 0;
    reg[31:0] multiply = 0;
    reg[3:0] sample_state = 0;
    reg[31:0] sample1 = 0;
    reg[31:0] sample2 = 0;
    reg[31:0] sample3 = 0;
    reg[31:0] sample4 = 0;
    reg[31:0] sample5 = 0;
    reg[31:0] sample6 = 0;
    reg[31:0] sample7 = 0;
    reg[31:0] sample8 = 0;
    reg[31:0] sample9 = 0;
    reg[31:0] sample10 = 0;
    
    reg[31:0] average1 = 0;
    reg[31:0] average2 = 0;
    reg[31:0] average3 = 0;
    reg[31:0] average4 = 0;
    reg[31:0] average5 = 0;
    reg[31:0] average6 = 0;
    reg[31:0] average7 = 0;
    
    always@ (posedge clk_20k) begin
    multiply <= MIC_in * 10;
    timer <= (timer == 2000) ? 0:timer+1;
        if(multiply > 21000 && cross == 0) begin
            cross <= 1;
            count <= count + 1;
        end
        if(multiply < 21000 && cross == 1) begin
            cross <= 0;
        end
        if(timer == 2000) begin
            case(sample_state)
            4'b0000: begin
                sample1 <= count*10;
            end
            4'b0001: begin
                sample2 <= count*10;
            end
            4'b0010: begin
                sample3 <= count*10;
            end
            4'b0011: begin
                sample4 <= count*10;
            end
            4'b0100: begin
                sample5 <= count*10;
            end
            4'b0101: begin
                sample6 <= count*10;
            end
            4'b0110: begin
                sample7 <= count*10;
            end
            4'b0111: begin
                sample8 <= count*10;
            end
            4'b1000: begin
                sample9 <= count*10;
            end
            4'b1001: begin
                sample10 = count*10;
                average1 = (sample1 + sample2)/2;
                average2 = (sample3 + sample4)/2;
                average3 = (sample5 + sample6)/2;
                average4 = (sample7 + sample8)/2;
                average5 = (sample9 + sample10)/2;
                average6 = (average1 + average2)/2;
                average7 = (average3 + average4 + average5)/3;
                frequency = (average6 + average7)/2;
//                average8 <= (average5 + average6)/2;
//                average9 <= (average7 + average8)/2;
            end
            endcase
            count <= 0;
            sample_state <= (sample_state == 4'b1001) ? 0:sample_state + 1;
        end
    end    
endmodule
