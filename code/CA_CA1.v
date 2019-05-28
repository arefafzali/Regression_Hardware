module CA_CA1(input start, clk, rst, output ready ,output [13:0] w1 ,w2 ,b);
  
  wire initx1Reg, initx2Reg, inittReg, initw1Reg, initw2Reg, initbReg, initFlagReg,
 getdata, initReader, LdReader, Ldx1Reg, Ldx2Reg, LdtReg, Ldw1Reg, Ldw2Reg, LdbReg, LdFlagReg, 
 startAgain, dataFinish, equalFlag, againFlag;
 
 DataPath dp(initx1Reg, initx2Reg, inittReg, initw1Reg, initw2Reg, initbReg, initFlagReg,
 getdata, initReader, LdReader, Ldx1Reg, Ldx2Reg, LdtReg, Ldw1Reg, Ldw2Reg, LdbReg, LdFlagReg, 
 startAgain, clk, rst, dataFinish, equalFlag, againFlag, w1, w2, b);
 
 Controller ct(clk, rst, start, dataFinish, equalFlag, againFlag, initx1Reg, initx2Reg, inittReg,
 initw1Reg, initw2Reg, initbReg, initFlagReg, getdata, ready, initReader, LdReader, Ldx1Reg,
 Ldx2Reg, LdtReg, Ldw1Reg, Ldw2Reg, LdbReg, LdFlagReg, startAgain);
 
endmodule