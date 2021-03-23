 `timescale 1ns / 1ps
module SHIFT_REGISTER
#(
parameter WIDTH=4
)
(
input CLK,
input REST,
input WRITE_EN,
input SHIFT_EN,
input[WIDTH-1:0] PARALLEL_IN,
input SERIAL_IN,
output SERIAL_OUT,
output[WIDTH-1:0] PARALLEL_OUT
);
reg[WIDTH-1:0] DATA;
always @(posedge CLK)
begin
if(REST==1)
DATA<=0;
else if(WRITE_EN==1)
DATA<=PARALLEL_IN;
else if(SHIFT_EN==1)
DATA<={SERIAL_IN,DATA[WIDTH-1:1]};
end
assign SERIAL_OUT=DATA[0];
assign PARALLEL_OUT=DATA;
endmodule

