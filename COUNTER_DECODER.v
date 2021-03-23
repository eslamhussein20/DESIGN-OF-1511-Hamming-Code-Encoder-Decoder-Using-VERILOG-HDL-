`timescale 1ns / 1ps
module COUNTER_DECODER
#(
parameter WIDTH=4
)
(
input CLK,
input REST,
input ENABLE,
output [WIDTH-1:0] COUNTER_OUTPUT
);
reg [WIDTH-1:0] OUTPUT;
always @( posedge CLK or  posedge REST)
begin
if(REST==1)
OUTPUT<=0;
else if(ENABLE==1)
begin
OUTPUT<=OUTPUT+1;
if(OUTPUT ==10)
begin
 OUTPUT <= 0;
end

end
end
assign COUNTER_OUTPUT = OUTPUT;
endmodule
