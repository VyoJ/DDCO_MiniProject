module fulladder_1_bit(
	input a, b, c_in,
	output s, c_out
);	
	assign s = a ^ b ^ c_in;
	assign c_out = ((a ^ b) & c_in) | (a & b);
endmodule

module overflow_detection(
		input  a_last_bit,
		input  b_last_bit,
		input sum_last_bit,
		output reg overflow
);
		reg x, y;
		
		always @(*) begin
			x = a_last_bit ^ b_last_bit;
			y = b_last_bit ^ sum_last_bit;
			
			if(x)	overflow <= 1'b0;
			else if(!y)	overflow <= 1'b0;
			else overflow <= 1'b1;
		end

endmodule

module adder_16_bit(
	input [15:0] a,
	input [15:0] b,
	output [15:0] sum,
	output c_out
);
	wire c_in;
	assign c_in = 1'b0;
	fulladder_1_bit f0( .a( a[0] ), .b( b[0] ), .c_in( c_in ), .s( sum[0]), .c_out( ripple0 ) );
	fulladder_1_bit f1( .a( a[1] ), .b( b[1] ), .c_in( ripple0 ), .s( sum[1]), .c_out(ripple1) );
	fulladder_1_bit f2( .a( a[2] ), .b( b[2] ), .c_in( ripple1 ), .s( sum[2]), .c_out(ripple2) );
	fulladder_1_bit f3( .a( a[3] ), .b( b[3] ), .c_in( ripple2 ), .s( sum[3]), .c_out(ripple3) );
	fulladder_1_bit f4( .a( a[4] ), .b( b[4] ), .c_in( ripple3 ), .s( sum[4]), .c_out(ripple4) );
	fulladder_1_bit f5( .a( a[5] ), .b( b[5] ), .c_in( ripple4 ), .s( sum[5]), .c_out(ripple5) );
	fulladder_1_bit f6( .a( a[6] ), .b( b[6] ), .c_in( ripple5 ), .s( sum[6]), .c_out(ripple6) );
	fulladder_1_bit f7( .a( a[7] ), .b( b[7] ), .c_in( ripple6 ), .s( sum[7]), .c_out(ripple7) );
	fulladder_1_bit f8( .a( a[8] ), .b( b[8] ), .c_in( ripple7 ), .s( sum[8]), .c_out(ripple8) );
	fulladder_1_bit f9( .a( a[9] ), .b( b[9] ), .c_in( ripple8 ), .s( sum[9]), .c_out(ripple9) );
	fulladder_1_bit f10( .a( a[10] ), .b( b[10] ), .c_in( ripple9 ), .s( sum[10]), .c_out(ripple10) );
	fulladder_1_bit f11( .a( a[11] ), .b( b[11] ), .c_in( ripple10 ), .s( sum[11]), .c_out(ripple11) );
	fulladder_1_bit f12( .a( a[12] ), .b( b[12] ), .c_in( ripple11 ), .s( sum[12]), .c_out(ripple12) );
	fulladder_1_bit f13( .a( a[13] ), .b( b[13] ), .c_in( ripple12 ), .s( sum[13]), .c_out(ripple13) );
	fulladder_1_bit f14( .a( a[14] ), .b( b[14] ), .c_in( ripple13 ), .s( sum[14]), .c_out(ripple14) );
	fulladder_1_bit f15( .a( a[15] ), .b( b[15] ), .c_in( ripple14 ), .s( sum[15]), .c_out(c_out) );
endmodule

module sub_16_bit(
	input [15:0] a,
	input [15:0] b,
	output [15:0] sum,
	output c_out
);
	wire c_in;
	assign c_in = 1'b0;
	assign inv_b = (~b + 1'b1);
	fulladder_1_bit f0( .a( a[0] ), .b( inv_b[0] ), .c_in( c_in ), .s( sum[0]), .c_out( ripple0 ) );
	fulladder_1_bit f1( .a( a[1] ), .b( inv_b[1] ), .c_in( ripple0 ), .s( sum[1]), .c_out(ripple1) );
	fulladder_1_bit f2( .a( a[2] ), .b( inv_b[2] ), .c_in( ripple1 ), .s( sum[2]), .c_out(ripple2) );
	fulladder_1_bit f3( .a( a[3] ), .b( inv_b[3] ), .c_in( ripple2 ), .s( sum[3]), .c_out(ripple3) );
	fulladder_1_bit f4( .a( a[4] ), .b( inv_b[4] ), .c_in( ripple3 ), .s( sum[4]), .c_out(ripple4) );
	fulladder_1_bit f5( .a( a[5] ), .b( inv_b[5] ), .c_in( ripple4 ), .s( sum[5]), .c_out(ripple5) );
	fulladder_1_bit f6( .a( a[6] ), .b( inv_b[6] ), .c_in( ripple5 ), .s( sum[6]), .c_out(ripple6) );
	fulladder_1_bit f7( .a( a[7] ), .b( inv_b[7] ), .c_in( ripple6 ), .s( sum[7]), .c_out(ripple7) );
	fulladder_1_bit f8( .a( a[8] ), .b( inv_b[8] ), .c_in( ripple7 ), .s( sum[8]), .c_out(ripple8) );
	fulladder_1_bit f9( .a( a[9] ), .b( inv_b[9] ), .c_in( ripple8 ), .s( sum[9]), .c_out(ripple9) );
	fulladder_1_bit f10( .a( a[10] ), .b( inv_b[10] ), .c_in( ripple9 ), .s( sum[10]), .c_out(ripple10) );
	fulladder_1_bit f11( .a( a[11] ), .b( inv_b[11] ), .c_in( ripple10 ), .s( sum[11]), .c_out(ripple11) );
	fulladder_1_bit f12( .a( a[12] ), .b( inv_b[12] ), .c_in( ripple11 ), .s( sum[12]), .c_out(ripple12) );
	fulladder_1_bit f13( .a( a[13] ), .b( inv_b[13] ), .c_in( ripple12 ), .s( sum[13]), .c_out(ripple13) );
	fulladder_1_bit f14( .a( a[14] ), .b( inv_b[14] ), .c_in( ripple13 ), .s( sum[14]), .c_out(ripple14) );
	fulladder_1_bit f15( .a( a[15] ), .b( inv_b[15] ), .c_in( ripple14 ), .s( sum[15]), .c_out(c_out) );
endmodule

module adder_16_bit_with_overflow(
	input [15:0] a,
	input [15:0] b,
	output [15:0] sum,
	output c_out,
	output overflow
);
	wire [15:0] temp_sum;
	wire [15:0] overflow_extend;
	
	adder_16_bit x1( .a(a), .b(b), .sum(temp_sum), .c_out(c_out) ); 
	overflow_detection x2( .a_last_bit( a[15] ), .b_last_bit( b[15] ), .sum_last_bit( temp_sum[15] ), .overflow(overflow) );
	
	assign overflow_extend = { {15{overflow}}, overflow};
	
	assign sum = ((~overflow_extend) & temp_sum); 
	
endmodule

module multi_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [31:0] p
);
	reg [32:0] tmp_a, tmp_a_2comp, tmp_p;
	reg [15:0] a_2comp;
	integer i;
	
	always @(*) begin
		a_2comp = ((~ a) + 1'b1);
		tmp_a = {a, 17'b00000000000000000};
		tmp_a_2comp = {a_2comp, 17'b00000000000000000};		
		tmp_p = {16'b0000000000000000, b, 1'b0};		
		
		for(i=0; i<16; i=i+1) begin
			case(tmp_p[1:0])
				2'b00 : tmp_p = { tmp_p[32], tmp_p[32:1] };
				2'b01 : begin
							tmp_p = tmp_p + tmp_a;
							tmp_p = { tmp_p[32], tmp_p[32:1] };
						end
				2'b11 : tmp_p = { tmp_p[32], tmp_p[32:1] };
				2'b10 : begin
							tmp_p = tmp_p + tmp_a_2comp;
							tmp_p = { tmp_p[32], tmp_p[32:1] };
						end
				default : tmp_p = 33'bx;
			endcase	
		end
		
		p = tmp_p[32:1];
	end	
endmodule

module and_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);

	integer i;	

	always @(*) begin
		for(i=0; i<16; i=i+1) begin
			op[i] = a[i] & b[i];
		end

	end
endmodule

module or_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);

	integer i;	

	always @(*) begin
		for(i=0; i<16; i=i+1) begin
			op[i] = a[i] | b[i];
		end

	end
endmodule

module xor_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);

	integer i;
	
	always @(*) begin
		for(i=0; i<16; i=i+1) begin
			op[i] = a[i] ^ b[i];
		end
	end

endmodule

module xnor_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);

	integer i;
	
	always @(*) begin
		for(i=0; i<16; i=i+1) begin
			op[i] = ~(a[i] ^ b[i]);
		end
	end

endmodule

module nand_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);

	integer i;
	
	always @(*) begin
		for(i=0; i<16; i=i+1) begin
			op[i] = ~(a[i] & b[i]);
		end
	end

endmodule

module nor_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);

	integer i;
	
	always @(*) begin
		for(i=0; i<16; i=i+1) begin
			op[i] = ~(a[i] | b[i]);
		end
	end

endmodule

module lshift_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);
	reg [15:0] temp;
	integer i;
	always @(*) begin
		temp = a;
		for (i = 0; i < b; i = i + 1) begin
			temp = temp << 1;
		end
		op = temp;
	end
endmodule

module rshift_16_bit(
	input [15:0] a,
	input [15:0] b,
	output reg [15:0] op
);
	reg [15:0] temp;
	integer i;
	always @(*) begin
		temp = a;
		for (i = 0; i < b; i = i + 1) begin
			temp = temp >> 1;
		end
		op = temp;
	end
endmodule

module mux11(
    input [3:0] opcode,
	input [15:0] and_ans,
	input [15:0] or_ans,
	input [15:0] nand_ans,
	input [15:0] nor_ans,
	input [15:0] xor_ans,
	input [15:0] xnor_ans,
	input [15:0] lshift_ans,
	input [15:0] rshift_ans,
	input [15:0] add_ans,
	input [15:0] sub_ans,
	input [31:0] mul_ans,
	output reg [31:0] final_answer
);

	always@(*) begin
		case(opcode)
			4'b0000: final_answer={ {16{and_ans[15]} } , and_ans };
			4'b0001: final_answer={ {16{or_ans[15]} } , or_ans };
			4'b0010: final_answer={ {16{nand_ans[15]} } , nand_ans };
			4'b0011: final_answer={ {16{nor_ans[15]} } , nor_ans };
			4'b0100: final_answer={ {16{xor_ans[15]} } , xor_ans };
			4'b0101: final_answer={ {16{xnor_ans[15]} } , xnor_ans };
			4'b0110: final_answer={ {16{lshift_ans[15]} } , lshift_ans };
			4'b0111: final_answer={ {16{rshift_ans[15]} } , rshift_ans };
			4'b1000: final_answer={ {16{add_ans[15]} } , add_ans };
			4'b1001: final_answer={ {16{sub_ans[15]} } , sub_ans };
			4'b1010: final_answer= mul_ans;
		endcase
	end
endmodule