//

module Mux_DP_tb();
	logic clk;
	logic in1, in2, in3, in4; 
	logic [1:0] s;
	logic mux_out;
	
	MUX4TO1DP dut(in1, in2, in3, in4, s, mux_out);
	
	always
	   begin
			clk = 1; #5; clk = 0; #5;
		end
		
	initial begin 
	
	$display("Starting Simulation");
		in1 = 6'b0;in2 = 6'b1; s = 2'b00; #10;
		in1 = 6'b0;in2 = 6'b1; s = 2'b01; #10;
		in1 = 6'b1;in2 = 6'b0; s = 2'b01; #10;
		in1 = 6'b1;in2 = 6'b0; s = 2'b00; #10;
		in3 = 6'b0;in4 = 6'b1; s = 2'b10; #10;
		in3 = 6'b0;in4 = 6'b1; s = 2'b11; #10;
		in3 = 6'b1;in4 = 6'b0; s = 2'b11; #10;
		in3 = 6'b1;in4 = 6'b0; s = 2'b10; #10;
	
	end
	
endmodule