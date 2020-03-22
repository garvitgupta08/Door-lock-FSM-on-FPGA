`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2019 00:22:43
// Design Name: 
// Module Name: seven_seg1
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


module seven_seg1(input [3:0]number,output [7:0] cathode,output[3:0] anode);

reg [6:0] sseg_temp;
reg [3:0] an_temp=4'b1110;

always@(*)
begin
    case(number)
    4'b0000: sseg_temp<=7'b0000001;
    4'b0001: sseg_temp<=7'b1001111;
    4'b0010: sseg_temp<=7'b0010010;
    4'b0011: sseg_temp<=7'b0000110;
    4'b0100: sseg_temp<=7'b1001100;
    4'b0101: sseg_temp<=7'b0100100;
    4'b0110: sseg_temp<=7'b0100000;
    4'b0111: sseg_temp<=7'b0001111;
    4'b1000: sseg_temp<=7'b0000000;
    4'b1001: sseg_temp<=7'b0000100;
    4'b1010: sseg_temp<=7'b0001000;
    default: sseg_temp<=7'b1111110;
    endcase
end
assign anode=an_temp;
assign cathode={sseg_temp,1'b1};
endmodule
