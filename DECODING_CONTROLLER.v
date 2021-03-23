`timescale 1ns / 1ps
module DECODING_CONTROLLER(
input CLK,
input REST,
input DEVICE_EN ,
input[3:0] COUNT ,
output reg COUNTER_EN ,
output reg WRITE_EN,
output reg SHIFT_EN 
);
reg[2:0] STATE  ;
`define IDEAL            0 
`define WEITE            1
`define SHIFT            2
always @( posedge CLK or  posedge REST)
begin
if(REST == 1'b1)
STATE<=`WEITE;
else
case(STATE)
`IDEAL: 
begin
if(DEVICE_EN==1'b1)
STATE <=`WEITE;
else
STATE <=`IDEAL;
end	
`WEITE: 
begin
if(DEVICE_EN==1'b1)
STATE <=`SHIFT;
end	
`SHIFT: 
begin
if(DEVICE_EN==1'b1&&COUNT==10)
STATE <=`WEITE;
else if(DEVICE_EN==1'b1)
STATE <=`SHIFT;
end				
endcase
end
always @(*)
begin
SHIFT_EN = 1'b0;
COUNTER_EN = 1'b0;
WRITE_EN= 1'b0;
case(STATE)

`IDEAL:
begin
    
end



`WEITE:
begin
COUNTER_EN = 1'b1;
WRITE_EN= 1'b1;
end
`SHIFT:
begin
SHIFT_EN = 1'b1;
COUNTER_EN = 1'b1;
end
endcase
end	
endmodule
