//

module dflipflop
    (input  logic clk,
	  input  logic reset_n,
	  input  logic enable,
     input  logic [15:0] d,
     output logic [15:0] q);
	  

    always_ff@(posedge clk,negedge reset_n)
		if(!reset_n)
		  q <= 16'b0;
		  
		else if (enable)
	     q <= d;
			

endmodule