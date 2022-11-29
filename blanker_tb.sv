// blanker testbench

`timescale 10ns/10ps

module blanker_tb ();

  logic [3:0] Num_Hex3;
  logic [3:0] Num_Hex2;
  logic [3:0] Num_Hex1;
  logic [3:0] Num_Hex0;
  logic [1:0] mode;
  logic [5:0] Blankinternal;
   
  blanker uut (.Num_Hex3(Num_Hex3),
					.Num_Hex2(Num_Hex2),
					.Num_Hex1(Num_Hex1),
					.mode(mode),
					.Blankinternal(Blankinternal));
					  
  // Time zero
  initial begin
  $display("Starting simulation");
    mode = 00; #1;
	   Num_Hex0 = 4'b000; Num_Hex1 = 4'b000; Num_Hex2 = 4'b000; Num_Hex3 = 4'b000; #1;
	 
	   Num_Hex0 = 4'b1111; #1; // ___F
		Num_Hex1 = 4'b1111; #1; // __FF
		
    mode = 01; #1; 
	   Num_Hex0 = 4'b000; Num_Hex1 = 4'b000; Num_Hex2 = 4'b000; Num_Hex3 = 4'b000; #1;
	   // distance
	   Num_Hex0 = 4'b0010; #1;
		Num_Hex1 = 4'b0010; #1;
		Num_Hex2 = 4'b0010; #1; // _222
		Num_Hex3 = 4'b0010; #1; // 2222
		
    mode = 10; #1;
	   Num_Hex0 = 4'b000; Num_Hex1 = 4'b000; Num_Hex2 = 4'b000; Num_Hex3 = 4'b000; #1;
		
	   Num_Hex0 = 4'b0011; #1;
		Num_Hex1 = 4'b0011; #1;
		Num_Hex2 = 4'b0011; #1;
		Num_Hex3 = 4'b0011; #1; // 3333
		
    mode = 11; #1; 
      Num_Hex0 = 4'b000; Num_Hex1 = 4'b000; Num_Hex2 = 4'b000; Num_Hex3 = 4'b000; #1;
		
	   Num_Hex0 = 4'b1010; #1; // ___A
		Num_Hex1 = 4'b1010; #1; // __AA
		Num_Hex2 = 4'b1010; #1; // _AAA
		Num_Hex3 = 4'b1010; #1; // AAAA
		
    $display("Simulation finished");	
	 
  end

endmodule