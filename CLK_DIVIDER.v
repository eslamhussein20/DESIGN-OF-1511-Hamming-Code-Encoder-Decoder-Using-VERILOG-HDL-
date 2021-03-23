module CLK_DIVIDER #(
parameter WIDTH = 4,
parameter N = 11)
 
(CLK_IN,REST, CLK_OUT);
 
input CLK_IN;
input REST;
output CLK_OUT;
 
reg [WIDTH-1:0] POSETIVE_COUNT, NEGATIVE_COUNT;
 
 always @(posedge CLK_IN ,posedge REST )
 if (REST)
 POSETIVE_COUNT <=0;
 else if (POSETIVE_COUNT ==N-1) POSETIVE_COUNT <= 0;
 else POSETIVE_COUNT<= POSETIVE_COUNT +1;
 
 always @(negedge CLK_IN , posedge REST)
 if (REST)
 NEGATIVE_COUNT <=N-1;
 else  if (NEGATIVE_COUNT ==N-1) NEGATIVE_COUNT <= 0;
 else NEGATIVE_COUNT<= NEGATIVE_COUNT +1; 
 
assign CLK_OUT = ~(((POSETIVE_COUNT > (N>>1)) | (NEGATIVE_COUNT > (N>>1)))); 
endmodule