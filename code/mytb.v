`timescale 1ns/1ns
module TB ();
  reg clk=0, rst=0;
  reg start=0;
  wire ready;
  wire [13:0] w1 ,w2 ,b;
  CA_CA1 ca(start, clk, rst, ready , w1 ,w2 ,b);

  always #770 clk = ~clk;

  initial begin
    #1010 start = 1;
    #2065 start = 0; 
    #14000000 $stop;
  end

endmodule
  