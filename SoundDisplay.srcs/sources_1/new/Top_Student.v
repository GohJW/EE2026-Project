`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input baysis_clock,
    input  btnU,
    output reg [11:0] led,
    output led14,
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,    // Connect to this signal from Audio_Capture.v
    output rgb_cs, rgb_sdin, rgb_sclk, rgb_d_cn, rgb_resn, rgb_vccen, rgb_pmoden
    );

    wire wire_clk20k;
    wire wire_clk6p25m;
    wire [11:0] MIC_in;
    
    CLOCK_flexible unit_20khz(baysis_clock, 2499, wire_clk20k);
    Audio_Capture unit_audio(baysis_clock,wire_clk20k,J_MIC3_Pin3,J_MIC3_Pin1,J_MIC3_Pin4,MIC_in);
    CLOCK_flexible unit_6p25m(baysis_clock, 7, wire_clk6p25m);
    
    wire fbegin;
    wire [12:0] pixel_index;
    wire sendpix;
    wire samplepix;
    reg [15:0] oled_data = 0; 
    
    Oled_Display(.clk(wire_clk6p25m), .reset(0),
    .frame_begin(fbegin), .sending_pixels(sendpix), .sample_pixel(samplepix),
    .pixel_index(pixel_index),
    .pixel_data(oled_data),
    .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), .resn(rgb_resn), .vccen(rgb_vccen), .pmoden(rgb_pmoden),
    .teststate(0));
    
    
     always @(posedge wire_clk20k) begin
       led <= MIC_in;
       end
       
     wire [6:0] x;
     wire [5:0] y;
     coordinates unitc(pixel_index, x, y);
     
     wire delay_A;
     OLED_button unitA(btnU, baysis_clock, 299999999, delay_A);
     assign led14 = delay_A;
     
     reg [3:0] state = 4'b00000;
     
     always @ (posedge delay_A) begin
     state <= (state == 4'b1111) ? 0: (state << 1) + 1;
     end
     always @(posedge wire_clk6p25m) begin
     if((x == 2 || x == 93) && (y > 1 && y < 62)) // start of red
        begin
        oled_data <= 16'b1111100000000000;
        end 
     else if((y == 2 || y == 61) && (x > 1 && x < 94)) //end of red
        begin
        oled_data <= 16'b1111100000000000;
        end
     else if (((x > 3 && x < 7) || (x > 88 && x < 92)) && (y > 3 && y < 60)) //start of orange
        begin
        oled_data <= 16'b1111110100000000;
        end
     else if (((y > 3 && y < 7) || (y > 56 && y < 60)) && (x > 3 && x < 92)) //end of orange
        begin
        oled_data <= 16'b1111110100000000;
        end
     else if ((x == 9 || x == 86) && (y > 8 && y < 55) && state[0] == 1) //start of green 1
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if ((y == 9 || y == 54) && (x > 8 && x < 87) && state[0] == 1)//end of green 1
     begin
     oled_data <= 16'b0000011111100000;
     end 
     else if ((x == 12 || x == 83) && (y > 11 && y < 52) && state[1] == 1) //start of green 2
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if ((y == 12 || y == 51) && (x > 11 && x < 84) && state[1] == 1)//end of green 2
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if ((x == 15 || x == 80) && (y > 14 && y < 49) && state[2] == 1) //start of green 3
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if ((y == 15 || y == 48) && (x > 14 && x < 81) && state[2] == 1)//end of green 3
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if ((x == 18 || x == 77) && (y > 17 && y < 46) && state[3] == 1) //start of green 4
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if ((y == 18 || y == 45) && (x > 17 && x < 78) && state[3] == 1)//end of green 4
     begin
     oled_data <= 16'b0000011111100000;
     end
     else if (x == 95) //test can remove
     begin
     oled_data <= 16'b0000000000011111;
     end
     else if (y == 63) //test can remove
     begin
     oled_data <= 16'b0000000000011111;
     end
     else //default to black
        begin
        oled_data <= 16'b0000000000000000;
        end
     end
    
    
    
    
endmodule