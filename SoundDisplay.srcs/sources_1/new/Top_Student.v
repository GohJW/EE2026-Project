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
    input  btnU, btnD, btnL, btnR, btnC,
    input sw0, sw1, sw2, sw3, sw4,
    output [8:0] led,
    output [3:0] an,
    output [7:0] seg,
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
    wire [15:0] oled_data_A;
    wire [15:0] oled_data_B;
    wire [15:0] oled_data_volume;
    
    Oled_Display(.clk(wire_clk6p25m), .reset(0),
    .frame_begin(fbegin), .sending_pixels(sendpix), .sample_pixel(samplepix),
    .pixel_index(pixel_index),
    .pixel_data(oled_data),
    .cs(rgb_cs), .sdin(rgb_sdin), .sclk(rgb_sclk), .d_cn(rgb_d_cn), .resn(rgb_resn), .vccen(rgb_vccen), .pmoden(rgb_pmoden),
    .teststate(0));
       
    wire [6:0] x;
    wire [5:0] y;
    coordinates unitc(pixel_index, x, y);
     
    wire delay_A;
    wire delay_B;
    OLED_button unitA(btnU, baysis_clock, 299999999, delay_A);
    OLED_button unitB(btnD, baysis_clock, 499999999, delay_B);
     
    assign led14 = delay_A;
    assign led12 = delay_B;
    
    oled_taskA A(delay_A, wire_clk6p25m, oled_data_A, x, y);
    oled_taskB B(delay_B, wire_clk6p25m, oled_data_B, x, y);
     
    wire [4:0]an_volume;
    wire [4:0] an_freq;
    wire [7:0]seg_volume;
    wire [7:0]seg_freq;
    wire [4:0]led_volume;
    
    wire [31:0] freq;
    wire [15:0] oled_data_tuner;
    wire [11:0] peak;
    wire [2:0] menustate;
    wire [15:0] oled_data_menu;
    assign led[4:0] = led_volume;
    assign seg = (menustate == 3'b101) ? seg_freq : seg_volume;
    assign an = (menustate == 3'b101) ? an_freq : an_volume;
     
   // wire[31:0] decibel;
    
   // DecibelIndicator unitDI(MIC_in, wire_clk20k, peak, decibel); 
    MenuModule(wire_clk6p25m, btnU, btnD, btnL, btnR, btnC, x, y, menustate, oled_data_menu);
    FrequencyIndicator(MIC_in, wire_clk20k,led[5],freq);
    assign led[6] = (freq > 200) ? 1:0;
    assign led[7] = (freq > 300) ? 1:0;
    assign led[8] = (freq > 400) ? 1:0;
   // wire [13:0] display;
   // assign display = (sw4 == 1) ? decibel[13:0]:freq[13:0];
    seg_display(wire_clk20k, freq[13:0], an_freq, seg_freq);
    TunerDisplay unitTunerD(freq, wire_clk6p25m, oled_data_tuner);
        
    AudioVolumeIndicator unitAV(MIC_in, wire_clk20k, wire_clk6p25m, an_volume, seg_volume, led_volume, oled_data_volume, peak, x, y);
    
    //    assign oled_data = (sw0 == 1) ? oled_data_B : oled_data_A;
    //    assign oled_data = (sw3 == 1) ? oled_data_tuner : (sw2 == 1) ? oled_data_volume : (sw1 == 1) ? oled_data_B : (sw0 == 1) ? oled_data_A : 0;
    //    assign oled_data = oled_data_volume;
    assign oled_data = (menustate[2] == 0) ? oled_data_menu: (menustate == 3'b100) ? oled_data_B:
    (menustate == 3'b110) ? oled_data_A: (menustate == 3'b111) ? oled_data_volume : oled_data_tuner;
     
    
  
endmodule