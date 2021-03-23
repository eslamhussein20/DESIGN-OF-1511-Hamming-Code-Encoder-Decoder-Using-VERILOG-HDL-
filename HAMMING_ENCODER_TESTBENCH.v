 `timescale 1ns/1ps
module HAMMING_ENCODER_TESTBENCH;
reg clk;
reg reset;
wire clk_out_a;
wire clk_out_b;
reg serial_in;
reg device_en;
wire serial_out;
CLK_DIVIDER  #(.N(15)) CLK_A_11MHZ 
(
.CLK_IN(clk),
.REST(reset),
.CLK_OUT(clk_out_a)
);
CLK_DIVIDER  #(.N(11)) CLK_B_15MHZ 
(
.CLK_IN(clk),
.REST(reset),
.CLK_OUT(clk_out_b)
);
HAMMING_ENCODER_DATAPATH HE_UUT (
.REST(reset), 
.CLK_A(clk_out_a),
.CLK_B(clk_out_b),
.SERIAL_IN(serial_in) ,
.DEVICE_EN(device_en) ,
.SERIAL_OUT(serial_out)
);
initial
clk= 1'b1;
parameter CLK_PERIOD=6060;
parameter CLK_PERIOD_A=CLK_PERIOD*15;
always begin
clk=~clk;
#(CLK_PERIOD/2);
end
initial
begin
clk = 1;
device_en=1;
reset = 0;
#(CLK_PERIOD)
reset = 1;
#(1.5*CLK_PERIOD);
reset=1'b0;
//11101010101
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
//10011101110
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
//01100110011
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
#(11*CLK_PERIOD_A) 
$finish;
end 
endmodule
 