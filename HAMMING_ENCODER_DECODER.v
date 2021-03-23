 `timescale 1ns/1ps
module HAMMING_ENCODER_DECODER(
input clk_tx,
input clk_rx,
input reset_tx,
input reset_rx,

input serial_in,
input device_en,
output serial_out);

wire serial_line;
wire clk_out_a;
wire clk_out_b;
wire clk_out_c;
wire clk_out_d;
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


endmodule
 