module alu(
	input [15:0] a,
	input [15:0] b,
	input [3:0] op_code,
	output [31:0] out,
	output overflow,
	output c_out
);
	wire [15:0] and_result;
	wire [15:0] or_result;
	wire [15:0] nand_result;
	wire [15:0] nor_result;
	wire [15:0] xor_result;
	wire [15:0] xnor_result;
	wire [15:0] lshift_result;
	wire [15:0] rshift_result;
	wire [15:0] add_result;
	wire [15:0] sub_result;
	wire [31:0] mult_result;

	adder_16_bit_with_overflow x1( .a(a), .b(b), .sum(add_result), .c_out(c_out), .overflow(overflow) );
	sub_16_bit x2( .a(a), .b(b), .d(sub_result), .b_out(c_out) );
	multi_16_bit x3( .a(a), .b(b), .p(mult_result) );
	and_16_bit x4( .a(a), .b(b), .op(and_result) );
	or_16_bit x5( .a(a), .b(b), .op(or_result) );
	nand_16_bit x6( .a(a), .b(b), .op(nand_result) );
	nor_16_bit x7( .a(a), .b(b), .op(nor_result) );
	xor_16_bit x8( .a(a), .b(b), .op(xor_result) );
	xnor_16_bit x9( .a(a), .b(b), .op(xnor_result) );
	lshift_16_bit x10( .a(a), .b(b), .op(lshift_result) );
	rshift_16_bit x11( .a(a), .b(b), .op(rshift_result) );

	mux11 x12(op_code, and_result, or_result, nand_result, nor_result, xor_result, xnor_result, lshift_result, rshift_result, and_result, sub_result, mult_result, out);
endmodule