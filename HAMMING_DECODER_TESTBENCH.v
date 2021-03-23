 `timescale 1ns/1ps
module HAMMING_DECODER_TESTBENCH;
reg clk;
reg reset;
wire clk_out_c;
wire clk_out_d;
reg serial_in;
reg device_en;
wire serial_out;
CLK_DIVIDER #(.N(15)) CLK_D_11MHZ  
(clk,reset,clk_out_c);
CLK_DIVIDER #(.N(11)) CLK_C_15MHZ  
(clk,reset,clk_out_d);
HAMMING_DECODER_DATAPATH HD_UUT (
.REST(reset), 
.CLK_C(clk_out_d),
.CLK_D(clk_out_c),
.SERIAL_IN(serial_in) ,
.DEVICE_EN(device_en) ,
.SERIAL_OUT(serial_out)
);
initial
clk= 1'b1;
parameter CLK_PERIOD=6060;
parameter CLK_PERIOD_A=CLK_PERIOD*11;
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
//110 0110 1100 1001
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b0;
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
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;

#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b1;
//   001    1011     0010     1110
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

serial_in=1'b1;
#(CLK_PERIOD_A)
serial_in=1'b0;
#(CLK_PERIOD_A)
serial_in=1'b0;
// 010 1100 0011 0011
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
serial_in=1'b0;

#(CLK_PERIOD_A)
serial_in=1'b1;
#(17*CLK_PERIOD_A) 
$finish;
end
endmodule
 