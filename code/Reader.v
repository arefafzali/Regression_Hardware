module Reader(input clk, startAgain, getData, Ld, init, rst, output reg [6:0] captured_data, output reg dataFinish);
	integer               data_file    ; // file handler
	integer               scan_file    ; // file handler
	`define NULL 0

	initial begin
	  data_file = $fopen("./data_set.txt", "r");
	  if (data_file == `NULL) begin
	    $display("data_file handle was NULL");
	    $finish;
	  end
	end

	always @(posedge clk) begin
		if(getData)
			scan_file = $fscanf(data_file, "%b ", captured_data); 
			if ($feof(data_file))
			    dataFinish = 1;
			else
				dataFinish = 0;
		if(startAgain || rst || Ld || init)
			data_file = $fopen("./data_set.txt", "r");
	end
	
endmodule