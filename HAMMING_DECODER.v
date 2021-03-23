module HAMMING_DECODER(
inout [14:0]DECODER_INPUT,
output [14:0] corecction , 
output [10:0] DECODER_OUTPUT	);
wire d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15 ;
wire c1;
wire c2;
wire c3;
wire c4;
wire [14:0] detection;

 xor(c1,DECODER_INPUT[0],DECODER_INPUT[2],DECODER_INPUT[4],DECODER_INPUT[6],DECODER_INPUT[8],DECODER_INPUT[10],DECODER_INPUT[12],DECODER_INPUT[14]);
 xor(c2,DECODER_INPUT[1],DECODER_INPUT[2],DECODER_INPUT[5],DECODER_INPUT[6],DECODER_INPUT[9],DECODER_INPUT[10],DECODER_INPUT[13],DECODER_INPUT[14]);
 xor(c3,DECODER_INPUT[3],DECODER_INPUT[4],DECODER_INPUT[5],DECODER_INPUT[6],DECODER_INPUT[11],DECODER_INPUT[12],DECODER_INPUT[13],DECODER_INPUT[14]);
 xor(c4,DECODER_INPUT[7],DECODER_INPUT[8],DECODER_INPUT[9],DECODER_INPUT[10],DECODER_INPUT[11],DECODER_INPUT[12],DECODER_INPUT[13],DECODER_INPUT[14]);

 

	assign d0=(~c1&~c2&~c3&~c4),
			 d1=(~c1&~c2&~c3&c4),
			 d2=(~c1&~c2&c3&~c4),
			 d3=(~c1&~c2&c3&c4),
			 d4=(~c1&c2&~c3&~c4),
			 d5=(~c1&c2&~c3&c4),
			 d6=(~c1&c2&c3&~c4),
			 d7=(~c1&c2&c3&c4),
			 d8=(c1&~c2&~c3&~c4),
			 d9=(c1&~c2&~c3&c4),
			 d10=(c1&~c2&c3&~c4),
			 d11=(c1&~c2&c3&c4),
			 d12=(c1&c2&~c3&~c4),
			 d13=(c1&c2&~c3&c4),
			 d14=(c1&c2&c3&~c4),
			 d15=(c1&c2&c3&c4);
 
 
 
assign  detection[0] = DECODER_INPUT[0] ^ d1 ;
assign  detection[1] = DECODER_INPUT[1] ^ d2 ;
assign  detection[2] = DECODER_INPUT[2] ^ d3 ;
assign  detection[3] = DECODER_INPUT[3] ^ d4 ;
assign  detection[4] = DECODER_INPUT[4] ^ d5 ;
assign  detection[5] = DECODER_INPUT[5] ^ d6 ;
assign  detection[6] = DECODER_INPUT[6] ^ d7 ;
assign  detection[7] = DECODER_INPUT[7] ^ d8 ;
assign  detection[8] = DECODER_INPUT[8] ^ d9 ;
assign  detection[9] = DECODER_INPUT[9] ^ d10 ;
assign  detection[10] = DECODER_INPUT[10] ^ d11 ;
assign  detection[11] = DECODER_INPUT[11] ^ d12 ;
assign  detection[12] = DECODER_INPUT[12] ^ d13 ;
assign  detection[13] = DECODER_INPUT[13] ^ d14 ;
assign  detection[14] = DECODER_INPUT[14] ^ d15 ;

assign corecction = detection[14:0] ;
assign DECODER_OUTPUT = {corecction[14],corecction[13],corecction[12],corecction[11],corecction[10],corecction[9],corecction[8],corecction[6],corecction[5],corecction[4],corecction[2]};


 endmodule 