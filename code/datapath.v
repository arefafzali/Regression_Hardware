module DataPath(input initx1Reg, initx2Reg, inittReg, initw1Reg, initw2Reg, initbReg, initFlagReg,
 getdata, initReader, LdReader, Ldx1Reg, Ldx2Reg, LdtReg, Ldw1Reg, Ldw2Reg, LdbReg, LdFlagReg, 
 startAgain, clk, rst, output dataFinish, equalFlag, againFlag, output signed [13:0] w1, w2, b);
 
  wire signed [6:0] xprime, x1, x2;
  wire signed [13:0] x1w1, x2w2 ,Sxiwi ,yin ,atandb ,x1atx2at ,x1atandw1 ,x2atandw2, x1at, x2at;
  wire signed [3:0] a=4'b 0011;
  wire signed [1:0] tprime, t;
  wire signed [3:0] at;

  Reader reader(clk, startAgain, getdata, LdReader, initReader, rst ,xprime , dataFinish);
  assign tprime = xprime[1:0];
  Reg7 x1reg(initx1Reg, Ldx1Reg, clk, rst, xprime, x1);
  Reg7 x2reg(initx2Reg, Ldx2Reg, clk, rst, xprime, x2);
  Reg2 treg(inittReg, LdtReg ,clk ,rst , tprime, t);
  Reg14 w1reg(initw1Reg, Ldw1Reg, clk, rst, x1atandw1, w1);
  Reg14 w2reg(initw2Reg, Ldw2Reg, clk, rst, x2atandw2, w2);
  bReg breg(initbReg, LdbReg ,clk ,rst , atandb, b);


  multi7_14 m1(x1, w1, x1w1);
  multi7_14 m2(x2, w2, x2w2);
  Adder14_14 a1(x1w1 ,x2w2 ,Sxiwi);
  Adder14_14 a2(Sxiwi ,b ,yin);
  assign equalFlag = ~(yin[13] ^ t[1]);


  assign at = a*t;
  multi7_4 m4(x1, at, x1at);
  multi7_4 m5(x2, at, x2at);
  Adder14_4 a3(b ,at ,atandb);
  Adder14_14 a4(x1at ,w1 ,x1atandw1);
  Adder14_14 a5(x2at ,w2 ,x2atandw2);


  flagReg freg(initFlagReg, LdFlagReg, clk, rst, againFlag);

endmodule