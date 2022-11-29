// top level module
// Watch out for case sensitivity when translating from VHDL.
// Also note that the .QSF is case sensitive.

module top_level
 (input  logic       clk, reset_n, enable,
  input  logic [9:0] SW,
  output logic [9:0] LEDR,
  output logic [7:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5);
  
  logic [3:0]  Num_Hex0, Num_Hex1, Num_Hex2, Num_Hex3;
  logic [4:0]  Num_Hex4, Num_Hex5;   
  logic [5:0]  DP_in,DP_in1,DP_in2,DP_in3,DP_in4;
  logic [5:0]  Blanked;
  
  logic [12:0] switch_inputs;
  logic [15:0] bcd;  
  logic [9:0]  syn_switches;
  
  logic [15:0] mux_out,outvalue;
  logic [15:0] hardcoded = 16'b0101_1010_0101_1010;
  logic        store_result;
  
  logic [12:0] ADC_voltage,ADC_distance;
  logic [15:0] voltage_d,distance_d;
  logic [11:0] ADC_raw,ADC_out;
  
  logic [5:0]  mux_outdp;
  logic [15:0] q;
  logic [15:0] n;
  logic [5:0]  Blankinternal;
  
  assign Num_Hex0 = n [3:0];
  assign Num_Hex1 = n [7:4];
  assign Num_Hex2 = n [11:8];
  assign Num_Hex3 = n [15:12];
 
  
  assign DP_in1 = 6'b000000;
  assign DP_in2 = 6'b000100;
  assign DP_in3 = 6'b001000;
  assign DP_in4 = 6'b000000;

  assign Num_Hex4 = 5'b10000;
  assign Num_Hex5 = 5'b10000;   
  assign DP_in    = 6'b000000; // position of the decimal point in the display (1=LED on,0=LED off)
  //assign Blank    = 6'b111000; // blank the 2 MSB 7-segment displays (1=7-seg display off, 0=7-seg display on)  
                                                 
  assign LEDR[9:0]         = SW[9:0]; // gives visual display of the switch inputs to the LEDs on board
  assign switch_inputs     = {5'b00000,SW[7:0]};
  
  assign Blanked = {2'b11,Blankinternal[3:0]};

							  
 blanker blanker (.Num_Hex3(Num_Hex3),
						.Num_Hex2(Num_Hex2),
						.Num_Hex1(Num_Hex1),
						.mode(SW[9:8]),
						.Blankinternal(Blankinternal));
							
  debounce debouncer (.clk(clk), 
				          .reset_n(reset_n), 
				          .button(enable), 
				          .result(store_result));
  
  synchronizer synchronizer (.clk(clk),
                            .reset_n(reset_n),
					             .in(SW),
						          .out(syn_switches));
 
  MUX4TO1 ModeMux (.in1({8'b00000000,syn_switches[7:0]}), 
					    .in2(distance_d),
					    .in3(voltage_d),
					    .in4(ADC_out),
					    .s(syn_switches[9:8]),
					    .mux_out(mux_out));
					
  MUX4TO1DP DPMux (.in1(DP_in1),
						 .in2(DP_in2),
						 .in3(DP_in3),
						 .in4(DP_in4),
						 .s(syn_switches[9:8]),
						 .mux_out(mux_outdp));
						
  SevenSegment SevenSeg_ins(.Num_Hex0(Num_Hex0),//.Num_Hex0(ADC_raw[3:0]),
                            .Num_Hex1(Num_Hex1),//.Num_Hex1(ADC_raw[7:4]),
                            .Num_Hex2(Num_Hex2),//.Num_Hex2(ADC_raw[11:8]),
                            .Num_Hex3(Num_Hex3),
                            .Num_Hex4(Num_Hex4),
                            .Num_Hex5(Num_Hex5),
                            .Hex0(HEX0),
                            .Hex1(HEX1),
                            .Hex2(HEX2),
                            .Hex3(HEX3),
                            .Hex4(HEX4),
                            .Hex5(HEX5),
                            .DP_in(mux_outdp),
									 .Blanked(Blanked));
  
  binary_bcd distance_bcd (.clk(clk),                          
                            .reset_n(reset_n),                                 
                            .binary(ADC_distance),    
                            .bcd(distance_d));

  
  binary_bcd voltage_bcd (.clk(clk),                          
                            .reset_n(reset_n),                                 
                            .binary(ADC_voltage),    
                            .bcd(voltage_d));
									 

	dflipflop flop (.clk(clk),
						 .reset_n(reset_n),
						 .enable(store_result),
						 .d(mux_out),
						 .q(n)); 
								 
	ADC_Data ADC (.clk(clk),
				.reset_n(reset_n),
				.voltage(ADC_voltage),
				.distance(ADC_distance),
				.ADC_raw(ADC_raw),
				.ADC_out(ADC_out));

endmodule
