`timescale 1ns / 1ps
module HAMMING_DECODER_DATAPATH
(
input REST ,
input CLK_D,
input CLK_C ,
input SERIAL_IN ,
input DEVICE_EN ,
output SERIAL_OUT
);
/**************************************************************************/
wire[3:0] count;
wire counter_en;
wire write_en ;
wire shift_en ;
wire [14:0] decoder_input_15_bits;
wire [10:0] decoder_output_11_bits;
/**************************************************************************/
DECODING_CONTROLLER DECODING_CONTROLLER_RX
(
.CLK(CLK_D),
.REST(REST),
.DEVICE_EN (DEVICE_EN),
.COUNT (count),
.COUNTER_EN (counter_en),
.WRITE_EN(write_en),
.SHIFT_EN(shift_en) 
);
/**************************************************************************/
SHIFT_REGISTER 
#(
.WIDTH(15)
) 
SHIFT_REGISTER_RX_C 
(
.REST(REST),
.CLK(CLK_C),
.SERIAL_IN(SERIAL_IN),
.WRITE_EN(0),
.SHIFT_EN(1),
.PARALLEL_OUT(decoder_input_15_bits)
);
/**************************************************************************/
HAMMING_DECODER HAMMING_DECODER_RX
(
.DECODER_INPUT(decoder_input_15_bits),
.DECODER_OUTPUT(decoder_output_11_bits)
);
/**************************************************************************/
SHIFT_REGISTER 
#(
.WIDTH(11)
) 
SHIFT_REGISTER_RX_D 
(
.REST(REST),
.CLK(CLK_D),
.WRITE_EN(write_en),
.SHIFT_EN(shift_en),
.PARALLEL_IN(decoder_output_11_bits),
.SERIAL_IN(),
.SERIAL_OUT(SERIAL_OUT)
);
/**************************************************************************/
COUNTER_DECODER
#(
.WIDTH(4)
)
COUNTER_RX_D
(
.CLK(CLK_D),
.REST(REST),
.ENABLE(counter_en),
.COUNTER_OUTPUT(count)
);

/***************************************************************************/
endmodule
