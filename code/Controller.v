module Controller (input clk, rst,
	input start, dataFinish, equalFlag, againFlag,
	output reg initx1Reg, initx2Reg, inittReg, initw1Reg, initw2Reg, initbReg, initFlagReg, getdata,
	 ready, initReader, LdReader, Ldx1Reg, Ldx2Reg, LdtReg, Ldw1Reg, Ldw2Reg, LdbReg, LdFlagReg, startAgain);

	reg [3:0] presentStage, nextStage;

	always @(posedge clk or posedge rst) begin
		if (rst) presentStage = 0;
		else presentStage = nextStage;
	end

	always @(presentStage, start, dataFinish, equalFlag, againFlag) begin
		case(presentStage)
			0: nextStage = start ? 1 : 0;
			1: nextStage = !start ? 2 : 1;
			2: nextStage = 3;
			3: nextStage = 4;
			4: nextStage = 5;
			5: nextStage = 6;
			6: nextStage = 7;
			7: nextStage = !equalFlag ? 8 :
							!dataFinish ? 3 :
							againFlag ? 9 : 0;
			8: nextStage = dataFinish ? 9 : 3;
			9: nextStage = 3;
			default: nextStage = 0;
		endcase
	end

	always @(presentStage) begin
		{initx1Reg, initx2Reg, inittReg, initw1Reg, initw2Reg, initbReg, initFlagReg, ready, initReader, getdata,
			LdReader, Ldx1Reg, Ldx2Reg, LdtReg, Ldw1Reg, Ldw2Reg, LdbReg, LdFlagReg, startAgain} = 19'b 0;
	
		case(presentStage)
			0: begin
				ready = 1;
			end
			1:{initx1Reg, initx2Reg, inittReg, initw1Reg, initw2Reg, initbReg, initFlagReg, initReader} = 8'b 11111111;
			2: LdReader = 1;
			3: {Ldx1Reg, getdata} = 2'b 11;
			4: {Ldx1Reg, getdata} = 2'b 11;
			5: {Ldx2Reg, getdata} = 2'b 11;
			6: LdtReg = 1;
			7: ;
			8:{LdbReg, Ldw1Reg, Ldw2Reg, LdFlagReg} = 4'b 1111;
			9:{startAgain, initFlagReg} = 2'b 11;
		endcase
	end
	
endmodule