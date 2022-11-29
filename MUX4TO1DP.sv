//

module MUX4TO1DP
 #(parameter width=6)
  (input  logic [width-1:0] in1,in2,in3,in4,
   input  logic [1:0]        s,
   output logic [width-1:0] mux_out);

  always_comb
        case(s)
        0: mux_out = in1; // no decimal values for hexadecimal
        1: mux_out = in2; // 2 decimal values for distance 
        2: mux_out = in3; // 3 decimal values for voltage
        3: mux_out = in4; // no decimal values for ADC 12-bit average


        default: mux_out = in1;
        endcase

endmodule