//

`timescale 10ns/10ps

module average_tb ();

	 logic clk, reset_n, EN;
	 logic [11:0] Din;
	 logic [11:0] Q;
	
	 
  averager256 testbench_ave (.clk(clk),
									 .reset_n(reset_n),
									 .EN(EN),
									 .Din(Din),
									 .Q(Q));

  logic [11:0] sum;
  logic [11:0] ave;
  
  // Generate clock							 
  always 
    begin
	 clk  = 1; #1; clk = 0; #1;
	 end 
	 
  
  initial begin
  $display(" << Starting the Simulation >>");
  
  sum = 12'b0; ave = 12'b0;
  reset_n = 0; #1;
  EN = 1; #1;
    
  // Testing average calculation for decimal 2047
  for (int i = 0 ; i <= 256 ; i++) begin
    Din <= 12'b0000_0000_0000; #1;
	 sum <= sum + Din;
  end
  ave = sum/256;
     
  end
	 
endmodule

