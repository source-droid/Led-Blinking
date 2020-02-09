

module Blinky_1Hz(clock_in, clock_out);
 input clock_in; // System clock
 output [15:0] clock_out; // Low-frequency clock
 reg [31:0] counter_out; // register for storing values
 reg [15:0] clock_out; // register buffer for output port

 initial begin
 counter_out<=32'h00000000; // 0 in Hexadecimal format
 clock_out<=16'b1010_1010_1010_1010;
 end
 //this always block runs on the fast 100MHz clock
 always @(posedge clock_in)
 begin
 counter_out<=counter_out + 32'h00000001; // Adding one at every clock pulse
 if (counter_out>32'h989680) // If count value reaches to 10000000 = 10^7
 begin
 counter_out<=32'h00000000; // reset the counter
 clock_out <= ~clock_out; // and invert the clock pulse level
 end
 end
 endmodule