`timescale 1ns / 1ps
module HAMMING_ENCODER_DATAPATH
(
input REST ,
input CLK_A,
input CLK_B,
input SERIAL_IN ,
input DEVICE_EN ,
output SERIAL_OUT
);
/**************************************************************************/

wire[3:0] count;
wire counter_en;
wire write_en ;
wire shift_en ;
wire [10:0] encoder_input_11_bits;
wire [14:0] encoder_output_15_bits;

/**************************************************************************/
ENCODING_CONTROLLER ENCODING_CONTROLLER_TX
(
.CLK(CLK_B),
.REST(REST),
.DEVICE_EN (DEVICE_EN),
.COUNT(count),
.COUNTER_EN(counter_en),
.WRITE_EN(write_en),
.SHIFT_EN(shift_en) 
);
/**************************************************************************/
SHIFT_REGISTER 
#(
.WIDTH(11)
) 
SHIFT_REGISTER_TX_A 
(
.REST(REST),
.CLK(CLK_A),
.SERIAL_IN(SERIAL_IN),
.WRITE_EN(0),
.SHIFT_EN(1),
.PARALLEL_OUT(encoder_input_11_bits)
);

/**************************************************************************/
HAMMING_ENCODER HAMMING_ENCODER_TX
(
.ENCODER_IN(encoder_input_11_bits),
.ENCODER_OUT(encoder_output_15_bits)
);
/**************************************************************************/
SHIFT_REGISTER

#(
.WIDTH(15)
) 
SHIFT_REGISTER_TX_B 
(
.REST(REST),
.CLK(CLK_B),
.WRITE_EN(write_en),
.SHIFT_EN(shift_en),
.PARALLEL_IN(encoder_output_15_bits),
.SERIAL_IN(),
.SERIAL_OUT(SERIAL_OUT)
);
/**************************************************************************/
COUNTER_ENCODER
#(
.WIDTH(4)
)
COUNTER_TX_B
(
.CLK(CLK_B),
.REST(REST),
.ENABLE(counter_en),
.COUNTER_OUTPUT(count)
);

/***************************************************************************/
endmodule
