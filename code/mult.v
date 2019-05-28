module multi7_4(input signed [6:0] a, input signed [3:0] b , output reg signed [13:0] c);
  reg signed [27:0] d;
  reg signed [13:0] f=0;
  reg signed [13:0] g=0;
  always @(*) begin
    f[13:4] <= {{3{a[6]}}, a[6:0]};
    g[13:6] <= {{4{b[3]}}, b[3:0]};
  end
  always @(*) begin
    d[27:0]<=f*g;
    c[13:0]<=d[21:8];
  end
endmodule

module multi7_14(input signed [6:0] a,input signed [13:0] b ,output reg signed [13:0] c);
  reg signed [27:0] d;
  reg signed [13:0] f=0;
  always @(*) begin
    f[13:4] <= {{3{a[6]}}, a[6:0]};
  end
  always @(*) begin
    d[27:0]<=f*b;
    c[13:0]<=d[21:8];
  end
endmodule