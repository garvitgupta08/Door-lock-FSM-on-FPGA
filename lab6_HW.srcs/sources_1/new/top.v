`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 19:11:04
// Design Name: 
// Module Name: top
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
module top(input clk,input clr,input enter,inout[7:0] JA, output [7:0]cathode,output [3:0]anode);
wire flag;
wire [3:0]num;
Decoder d(.clk(clk),.Row(JA[7:4]),.Col(JA[3:0]),.DecodeOut(num),.clking(flag));

wire clk_6M;
wire clk_5M;  
clk_wiz_0 clk_gen_6M( .clk_out1(clk_6M),.clk_out2(clk_5M),.clk_in1(clk));     // using ip catalog to generate two clock of freq of 6.553hz and 1k

wire clk_200H;
wire clk_1K;
clk_div #(15) clk3 (.clk_in(clk_6M),.clk_out(clk_200H));      // generating 200hz clock usong clk_division module
clk_div #(12) clk4 (.clk_in(clk_5M),.clk_out(clk_1K));
 
wire clk_debounce;
clk_pulse debouncer(.clk_pulse(clk_debounce),.clk_200H(clk_200H),.in_0(flag),.in_1(enter));      // making debouncing pulse

wire [3:0] th;
wire [3:0] hu;
wire [3:0] te;
wire [3:0] on;
wire [3:0] present;
fsm_ccd_moore fsm(.clk(clk_debounce),.enter(enter),.clear(clr),.d_in(num),.thousands(th),.hundreds(hu),.tens(te),.ones(on),.present(present));

seven_seg ssd(.clk(clk_1K),.count1(on),.count2(te),.count3(hu),.count4(th),.anode(anode),.cathode(cathode));
//seven_seg1 ssd(.number(present),.anode(anode),.cathode(cathode));
endmodule
