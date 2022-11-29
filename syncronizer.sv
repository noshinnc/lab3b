// Module synchronizer

module synchronizer
  (input  logic       clk,
   input  logic       reset_n,
	input  logic [9:0] in,
	output logic [9:0] out);
	
	logic [9:0] n1;
	
	always_ff @(posedge clk)
	begin
	  if(!reset_n)
	    out <= 0;
		 
	  else begin
	    n1 <= in;
		 out <= n1;
	  end
	end

endmodule