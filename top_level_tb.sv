//  

/*`timescale 10ns/10ps

module top_level_tb();
  logic clk, reset_n, enable;
  logic [9:0] SW;
  logic [9:0] LEDR; 
  
  top_level dut(.clk(clk),
					 .reset_n(reset_n),
					 .enable(enable),
					 .SW(SW),
					 .LEDR(LEDR));
					 
  // Generate clock
  always begin
  clk = 1; #1; clk = 0; #1;
  end
  
  initial begin
  reset_n = 0; #2;
  
	    //HEX:
		SW=10'b0011111111;#(CLK_PERIOD*250); // s=00;SW[7:0]=11111111; output = FF;
		//distance
		SW=10'b0111111111;#(CLK_PERIOD*250); // s=01;SW[7:0]=11111111;
		//voltage
		SW=10'b1011111111;#(CLK_PERIOD*250); // S=10;
		//ADC_out
		SW=10'b1111111111;#(CLK_PERIOD*250); // s=11;
		// freeze;

        tb_button=0; #(CLK_PERIOD*2500);

        tb_button=1;#(CLK_PERIOD*250);
        tb_reset_n=0;
	 end
	 
	 
  end

endmodule*/

//Testbench of top_level

`timescale 1ns/1ps

module top_level_tb ();
   parameter CLK_PERIOD = 10;
   logic         clk = 0, reset_n = 1, enable = 1;
	logic  [9:0]  SW = 10'b0;

	 top_level uut (.clk(clk),
						 .reset_n(reset_n),
						 .SW(SW),
						 .enable(enable));
	                                                       
	 always #(CLK_PERIOD/2) clk = ~clk;
	
	 initial begin
	   reset_n = 0; #(CLK_PERIOD*2);
		reset_n = 1;# (CLK_PERIOD*2);
		
	   // Hexadecimal
		SW = 10'b0011111111; #(CLK_PERIOD*4); // s=00; FF
		
		// Distance
		SW =10'b0111111111; #(CLK_PERIOD*4); // s=01;
		
		// Voltage
		SW = 10'b1011111111; #(CLK_PERIOD*4); // S=10;
		
		// ADC_out
		SW = 10'b1111111111; #(CLK_PERIOD*4); // s=11;
		
		// Freeze
      enable = 0; #(CLK_PERIOD*4);
      enable = 1; #(CLK_PERIOD*4);	
		
      reset_n = 0;
		
	 end
	 
endmodule






























	
