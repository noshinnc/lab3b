// ADC_Data Testbench

`timescale 10ns/10ps

module ADC_Data_tb ();
  logic clk, reset_n;
  logic [12:0] voltage_tb, distance_tb;
  logic [11:0] ADC_raw_tb, ADC_out_tb;

  // Instantiaite 
  ADC_Data ADC_Data_tb ( .clk      (clk),
								 .reset_n  (reset_n),
								 .voltage  (voltage_tb),
								 .distance (distance_tb),
								 .ADC_raw  (ADC_raw_tb),
								 .ADC_out  (ADC_out_tb) );
  // Generate clock							 
  always 
    begin
	 clk  = 1; #1; clk = 0; #1;
	 end
	 
  initial begin
    $display(" << Starting the Simulation >>");
	 
	 reset_n = 1;
	 
	 // Test voltage with changing ADC_out 
	 for (int i = 0 ; i <= 4095 ; i++) begin
		ADC_raw_tb [11:0] = i; #10;
		
		if (i == 8) 
		  reset_n = 0;
	
    end
	 
	 // Test distance with changing ADC_out
	
	 // Test ADC_out with different ADC_raw values would be tb averager
  end
	 
	 
endmodule