//


module blanker
  (input  logic [3:0] Num_Hex3,
   input  logic [3:0] Num_Hex2,
	input  logic [3:0] Num_Hex1,
	input  logic [1:0] mode,
   output logic [5:0] Blankinternal);

  always @(Num_Hex3, Num_Hex2, Blankinternal)
  
  case (mode)
  
  2'b00: begin 
    case(Num_Hex3)
	   4'b0000: begin
		  case(Num_Hex2)
		  4'b0000: begin
		    case(Num_Hex1)
			 4'b0000: Blankinternal = 6'b11_1110;
			 default: Blankinternal = 6'b11_1100;
			 endcase end			
			 
		  default: Blankinternal = 6'b11_1000;
		  endcase end
		  
	 default: Blankinternal = 6'b11_0000; 
	 endcase end
	 
	 
  2'b01: begin
    case(Num_Hex3)
	   4'b000: Blankinternal = 6'b11_1000;
		default: Blankinternal = 6'b11_0000;
		endcase end
		
  2'b10: Blankinternal = 6'b11_0000;
  
  2'b11: begin
    case(Num_Hex3)
	   4'b000: Blankinternal = 6'b11_1000;
		default: Blankinternal = 6'b11_0000;
		endcase end
			
  endcase
  
endmodule
		  



