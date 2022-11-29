// 

module MUX4TO1
 #(parameter width=16)
  (input  logic [width-1:0] in1,in2,in3,in4,
   input  logic [1:0]        s,
   output logic [width-1:0] mux_out);

  always_comb
        case(s)
        0: mux_out = in1; // hexadecimal
        1: mux_out = in2; // distance
        2: mux_out = in3; // voltage
        3: mux_out = in4; // ADC 12-bit average


        default: mux_out = in1;
        endcase
endmodule
