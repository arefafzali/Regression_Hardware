module Reg7(input init, ld, clk, rst,input [6:0] in,output reg [6:0] out);
  always @(posedge clk,posedge rst) begin
    if(rst) out<=7'b 0;
    else begin
      if(init) out<=7'b 0;
      else if(ld) out<=in;
    end
  end
endmodule

module Reg14(input init, ld, clk, rst,input [13:0] in,output reg [13:0] out);
  always @(posedge clk,posedge rst) begin
    if(rst) out<=14'b 0;
    else begin
      if(init) out<=14'b 0;
      else if(ld) out<=in;
    end
  end
endmodule

module Reg2(input init, ld, clk, rst,input [1:0] in,output reg [1:0] out);
  always @(posedge clk,posedge rst) begin
    if(rst) out<=2'b 0;
    else begin
      if(init) out<=2'b 0;
      else if(ld) out<=in;
    end
  end
endmodule

module bReg(input init, ld, clk, rst,input [13:0] in,output reg [13:0] out);
  always @(posedge clk,posedge rst) begin
    if(rst) out<=14'b 0;
    else begin
      if(init) out<=14'b 00000000000000;
      else if(ld) out<=in;
    end
  end
endmodule

module flagReg(input init, ld, clk, rst,output reg out);
  always @(posedge clk,posedge rst) begin
    if(rst) out<=0;
    else begin
      if(init) out<=0;
      else if(ld) out<=1;
    end
  end
endmodule