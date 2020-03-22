`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 21:16:14
// Design Name: 
// Module Name: clk_pulse
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
module clk_pulse(input clk_200H,input in_0,input in_1,output clk_pulse);

wire inp_comp;
assign inp_comp= in_0 | in_1;
reg FF1_next,FF2_next,FF3_next; // inputs to the 3 flip flops
reg FF1_reg,FF2_reg,FF3_reg;    // at posedge input will be passed to these outputs

always@(posedge clk_200H)
begin
    FF1_reg<=FF1_next;
    FF2_reg<=FF2_next;
    FF3_reg<=FF3_next;    
end

always@(*)
begin
    FF1_next=inp_comp;
end

always@(*)
begin
    FF2_next=FF1_next;
end

always@(*)
begin
    FF3_next=FF2_next;
end

assign clk_pulse=FF1_reg & FF2_reg & FF3_reg;
endmodule
