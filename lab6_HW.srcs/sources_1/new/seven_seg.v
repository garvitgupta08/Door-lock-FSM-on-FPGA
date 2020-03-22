`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 23:24:10
// Design Name: 
// Module Name: seven_seg
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
module seven_seg(input clk,
input[3:0] count1,
input[3:0] count2,
input[3:0]count3,
input[3:0] count4,
output[3:0] anode,output[7:0] cathode);
reg [6:0] cathode_temp = 7'b1111111;
reg [3:0] anode_temp = 4'b1110;
reg [1:0] count = 0;
    
always @(posedge clk)
begin
    count = count + 1;
end

always@(*)
begin
    case(count)
    2'b00:
    begin
        case(count1)
                4'd0 : cathode_temp = 7'b0000001; //to display 0
                4'd1 : cathode_temp = 7'b0011000; //to display 1
                4'd2 : cathode_temp = 7'b0001000; //to display 2
                4'd3 : cathode_temp = 7'b0100100; //to display 3
                4'd4 : cathode_temp = 7'b0111000; //to display 4
                4'd5 : cathode_temp = 7'b1001111; //to display 5
                4'd6 : cathode_temp = 7'b1110001; //to display l
                4'd7 : cathode_temp = 7'b1101010; //to display n
                4'd8 : cathode_temp = 7'b1100011; //to display v
//                4'd9 : cathode_temp = 7'b0000100; //to display 9
          endcase
          anode_temp=4'b1110;
     end
     2'b01:
     begin
        case(count2)
                 4'd0 : cathode_temp = 7'b0000001; //to display 0
                4'd1 : cathode_temp = 7'b0011000; //to display 1
                4'd2 : cathode_temp = 7'b0001000; //to display 2
                4'd3 : cathode_temp = 7'b0100100; //to display 3
                4'd4 : cathode_temp = 7'b0111000; //to display 4
                4'd5 : cathode_temp = 7'b1001111; //to display 5
                4'd6 : cathode_temp = 7'b1110001; //to display l
                4'd7 : cathode_temp = 7'b1101010; //to display n
                4'd8 : cathode_temp = 7'b1100011; //to display v
         endcase
         anode_temp=4'b1101;
     end
     2'b10:
     begin
        case(count3)
                 4'd0 : cathode_temp = 7'b0000001; //to display 0
                4'd1 : cathode_temp = 7'b0011000; //to display 1
                4'd2 : cathode_temp = 7'b0001000; //to display 2
                4'd3 : cathode_temp = 7'b0100100; //to display 3
                4'd4 : cathode_temp = 7'b0111000; //to display 4
                4'd5 : cathode_temp = 7'b1001111; //to display 5
                4'd6 : cathode_temp = 7'b1110001; //to display l
                4'd7 : cathode_temp = 7'b1101010; //to display n
                4'd8 : cathode_temp = 7'b1100011; //to display v
          endcase
          anode_temp=4'b1011;
     end
     2'b11:
     begin
        case(count4)
                 4'd0 : cathode_temp = 7'b0000001; //to display 0
                4'd1 : cathode_temp = 7'b0011000; //to display 1
                4'd2 : cathode_temp = 7'b0001000; //to display 2
                4'd3 : cathode_temp = 7'b0100100; //to display 3
                4'd4 : cathode_temp = 7'b0111000; //to display 4
                4'd5 : cathode_temp = 7'b1001111; //to display 5
                4'd6 : cathode_temp = 7'b1110001; //to display l
                4'd7 : cathode_temp = 7'b1101010; //to display n
                4'd8 : cathode_temp = 7'b1100011; //to display v
        endcase
        anode_temp=4'b0111;
     end
     endcase
  end
  assign cathode={cathode_temp,1'b1};
  assign anode=anode_temp;
endmodule

