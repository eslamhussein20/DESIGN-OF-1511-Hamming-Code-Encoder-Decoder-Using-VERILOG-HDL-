 `timescale 1ns/1ps
module HAMMING_ENCODER_DECODER_TESTBENCH;
reg clk_tx;
reg clk_rx;
reg reset_tx;
reg reset_rx;
wire clk_out_a;
wire clk_out_b;
wire clk_out_c;
wire clk_out_d;
reg serial_in;
reg device_en;
wire serial_line;
wire serial_out;
CLK_DIVIDER  #(.N(15)) CLK_A_11MHZ 
(
.CLK_IN(clk_tx),
.REST(reset_tx),
.CLK_OUT(clk_out_a)
);
CLK_DIVIDER  #(.N(11)) CLK_B_15MHZ 
(
.CLK_IN(clk_tx),
.REST(reset_tx),
.CLK_OUT(clk_out_b)
);
HAMMING_ENCODER_DATAPATH HE_UUT (
.REST(reset_tx), 
.CLK_A(clk_out_a),
.CLK_B(clk_out_b),
.SERIAL_IN(serial_in) ,
.DEVICE_EN(device_en) ,
.SERIAL_OUT(serial_line)
);

initial
clk_tx= 1'b1;
parameter CLK_PERIOD=6060;
parameter CLK_PERIOD_11=CLK_PERIOD*15;
parameter CLK_PERIOD_15=CLK_PERIOD*11;
always begin
clk_tx=~clk_tx;
#(CLK_PERIOD/2);
end


initial
begin
clk_tx = 1;
device_en=1;
reset_tx = 0;
#(CLK_PERIOD)
reset_tx = 1;
#(1.5*CLK_PERIOD);
reset_tx=1'b0;
//11101010101
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
//10011101110
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
//01100110011
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
serial_in=1'b0;
#(CLK_PERIOD_11)
serial_in=1'b1;
#(CLK_PERIOD_11)
#(33*CLK_PERIOD_11) 
$finish;
end 
always begin
clk_rx=~clk_rx;
#(CLK_PERIOD/2);
end
CLK_DIVIDER  #(.N(15)) CLK_D_11MHZ 
(
.CLK_IN(clk_rx),
.REST(reset_rx),
.CLK_OUT(clk_out_d)
);
CLK_DIVIDER  #(.N(11)) CLK_C_15MHZ 
(
.CLK_IN(clk_rx),
.REST(reset_rx),
.CLK_OUT(clk_out_c)
);
HAMMING_DECODER_DATAPATH HD_UUT (
.REST(reset_rx), 
.CLK_C(clk_out_c),
.CLK_D(clk_out_d),
.SERIAL_IN(serial_line) ,
.DEVICE_EN(device_en) ,
.SERIAL_OUT(serial_out)
);

initial
begin
clk_rx = 1;

reset_rx = 0;
#(CLK_PERIOD)
reset_rx = 1;
#(1.5*CLK_PERIOD);
#(15*CLK_PERIOD_15)
#4;
reset_rx = 0;
/*
@(posedge clk_out_d);
#2;
reset_rx = 1;
#2;
reset_rx =0;*/

end 



endmodule
 