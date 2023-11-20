`timescale 1 ns / 1 ns
`define TESTVECS 11

module tb;
	reg clk, reset;
	reg [3:0] op; 
	reg [15:0] i0, i1;
	wire [31:0] o; 
	wire cout; 
	wire overflow;
	reg [35:0] test_vecs [0:(`TESTVECS-1)];

	integer i;

	initial begin reset = 1'b1; #12.5 reset = 1'b0; end
	initial clk = 1'b0; always #5 clk = ~clk;
	initial begin
		test_vecs[0][35:32] = 4'b0000; test_vecs[0][31:16] = 16'h03E8; test_vecs[0][15:0] = 16'h07D0;
		test_vecs[1][35:32] = 4'b0001; test_vecs[1][31:16] = 16'h03E8; test_vecs[1][15:0] = 16'h07D0;
		test_vecs[2][35:32] = 4'b0010; test_vecs[2][31:16] = 16'h03E8; test_vecs[2][15:0] = 16'h07D0;
		test_vecs[3][35:32] = 4'b0011; test_vecs[3][31:16] = 16'h03E8; test_vecs[3][15:0] = 16'h07D0;
		test_vecs[4][35:32] = 4'b0100; test_vecs[4][31:16] = 16'h03E8; test_vecs[4][15:0] = 16'h07D0;
		test_vecs[5][35:32] = 4'b0101; test_vecs[5][31:16] = 16'h03E8; test_vecs[5][15:0] = 16'h07D0;
		test_vecs[6][35:32] = 4'b0110; test_vecs[6][31:16] = 16'h03E8; test_vecs[6][15:0] = 16'h07D0;
		test_vecs[7][35:32] = 4'b0111; test_vecs[7][31:16] = 16'h03E8; test_vecs[7][15:0] = 16'h07D0;
		test_vecs[8][35:32] = 4'b1000; test_vecs[8][31:16] = 16'h03E8; test_vecs[8][15:0] = 16'h07D0;
		test_vecs[9][35:32] = 4'b1001; test_vecs[9][31:16] = 16'h03E8; test_vecs[9][15:0] = 16'h07D0;
		test_vecs[10][35:32] = 4'b1010; test_vecs[10][31:16] = 16'h03E8; test_vecs[10][15:0] = 16'h07D0;
	end

	initial {op, i0, i1} = 0;
	alu alu_0 (i0, i1, op, o, overflow, cout);
	initial begin
		#6 for(i=0; i<`TESTVECS; i=i+1)
		begin #10 {op, i0, i1} = test_vecs[i]; end
		#100 $finish;
	end

	initial begin 
		$dumpfile("tb_alu.vcd"); 
		$dumpvars(0,tb); 
	end
endmodule