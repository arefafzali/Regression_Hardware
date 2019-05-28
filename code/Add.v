module Adder14_14(input [13:0] a,b,output [13:0] c);
  assign c=a+b;
endmodule

module Adder14_4(input [13:0] a,input [3:0] b,output [13:0] c);
  reg [13:0] g=0;
  always @(*) begin
    g[13:6] <= {{4{b[3]}}, b[3:0]};
  end
  assign c=a+g;
endmodule