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
    input  btnU, btnD,
    input sw0,
//    output reg [11:0] led,
    output led12, led14,
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
    wire [15:0] oled_data;
    reg [15:0] oled_data_A = 0;
    reg [15:0] oled_data_B = 0;
    
    Oled_Display(.clk(wire_clk6p25m), .reset(0),
    .frame_begin(fbegin), .sending_pixels(sendpix), .sample_pixel(samplepix),
    .pixel_index(pixel_index),
    .pixel_data(oled_data),
    .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), .resn(rgb_resn), .vccen(rgb_vccen), .pmoden(rgb_pmoden),
    .teststate(0));
    
    
//     always @(posedge wire_clk20k) begin
//       led[11:0] <= MIC_in;
//       end
       
     wire [6:0] x;
     wire [5:0] y;
     coordinates unitc(pixel_index, x, y);
     
     wire delay_A;
     wire delay_B;
     OLED_button unitA(btnU, baysis_clock, 299999999, delay_A);
     OLED_button unitB(btnD, baysis_clock, 499999999, delay_B);
     
     
     assign led14 = delay_A;
     assign led12 = delay_B;
//     wire delay;
//     assign delay = (sw1==1) ? delay_B : (sw0==1) ? delay_A : 0;
     
     reg [3:0] state_A = 4'b0000;
     reg [2:0] state_B = 3'b000;
     
     assign oled_data = (sw0 == 1) ? oled_data_B : oled_data_A;
     
     always @(posedge delay_A) begin
        state_A <= (state_A == 4'b1111) ? 0 : (state_A << 1) + 1;
     end
     
     always @ (posedge delay_B) begin
     state_B <= (state_B == 3'b111) ? 0: (state_B << 1) + 1;
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
     else if (x == 95) //test can remove
     begin
     oled_data_A <= 16'b0000000000011111;
     end
     else if (y == 63) //test can remove
     begin
     oled_data_A <= 16'b0000000000011111;
     end
     else //default to black
        begin
        oled_data_A <= 16'b0000000000000000;
        end
     end
     
     always @(posedge wire_clk6p25m)
     begin
        if (x >= 43 && x <= 53) 
        begin
            if(y >= 45 && y <= 50) 
            begin
                oled_data_B[15:11] <= 5'b11111; // R
                oled_data_B[10:0] <= 11'b0; // G, B
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