`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2019 19:11:36
// Design Name: 
// Module Name: fsm_ccd_moore
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
module fsm_ccd_moore(input clk,input [3:0] d_in,input enter,input clear,output [3:0] thousands,output [3:0] hundreds,output [3:0]tens,output [3:0] ones,output [3:0] present);

reg [3:0] next_state;
parameter s0=4'b0000,s1=4'b0001,s2=4'b0010,s3=4'b0011,s4=4'b0100,s5=4'b0101,s6=4'b0110,s7=4'b0111,s8=4'b1000,s9=4'b1001,s10=4'b1010;
reg [3:0] present_state=s0;

reg [3:0] th=4'b0000;
reg [3:0] hu=4'b0000;
reg [3:0] te=4'b0000;
reg [3:0] on=4'b0000;

always@(posedge clk or posedge clear)
begin
    if(clear==1)
    begin
       present_state<=s0;
    end
    else
        present_state<=next_state;    
 end
 
always@(present_state)
begin
    case(present_state)
    s0: if(enter==1)
        begin
            next_state<=s9;
        end
        else if(d_in==4'b1100)
        begin
            next_state<=s1;
        end
        else
        begin
            next_state<=s5;
        end
   
   s1: if(enter==1)
       begin
          next_state<=s9;
       end
       else if(d_in==4'b1100)
       begin
             next_state<=s2;
       end
       else
       begin
            next_state<=s6;
       end
     
   s2: if(enter==1)
       begin
            next_state<=s9;
       end
       else if(d_in==4'b1101)
       begin
            next_state<=s3;
       end
       else
       begin
            next_state<=s7;
       end
       
   s3: if(enter==1)
       begin
            next_state<=s4;
       end
       else
       begin
            next_state<=s10;
       end
       
   s4: if(enter==1)
       begin
            next_state<=s4;
       end
       else if(d_in==4'b1100)
       begin
            next_state<=s1;
       end
       else
       begin
            next_state<=s5;
       end
       
   s5: if(enter==1)
       begin
            next_state<=s9;
       end
       else
       begin
            next_state<=s6;
       end
       
   s6: if(enter==1)
       begin
            next_state<=s9;
       end
       else 
       begin
            next_state<=s7;
       end
       
  s7: if(enter==1)
      begin
            next_state<=s8;
      end
      else
      begin
            next_state<=s10;
      end
      
  s8: if(enter==1)
      begin
            next_state<=s8;
      end
      else if(d_in==4'b1100)
      begin
            next_state<=s1;
      end
      else
      begin
            next_state<= s5;
      end
      
  s9: if(enter==1)
      begin
            next_state<=s9;
      end
      else if(d_in==4'b1100)
      begin
            next_state<=s1;
      end
      else   
      begin  
            next_state<=s5;
      end
      
 s10: if(enter==1)
      begin
            next_state<=s9;
      end
      else
      begin
            next_state<=s10;
      end     
//  default: present_state<=s0;
 endcase
 end
 
 always@(present_state)
 begin
    case(present_state)
   
    s4: begin th=4'b0001;  // pass
        hu=4'b0010;
        te=4'b0011;
        on=4'b0011;end
        
    s8: begin th=4'b0100;  // fail
        hu=4'b0010;
        te=4'b0101;
        on=4'b0110;   end
        
    s9: begin th=4'b0000;  // INV
        hu=4'b0101;
        te=4'b0111;
        on=4'b1000; end
        
    default begin th=4'b0000;
                    hu=4'b0000;
                    te=4'b0000;
                    on=4'b0000;
             end
    endcase
 end       
 assign thousands=th;
 assign hundreds=hu;
 assign tens=te;
 assign ones=on;       
 assign present=present_state; 
endmodule
