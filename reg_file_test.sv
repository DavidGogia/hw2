module reg_file_testBench1();
logic clk = 0;
logic write_enable_ARd = 0;
logic [3:0] Rn_Address = 0;
logic [3:0] Rs_Address = 0;
logic [3:0] Rm_Address = 0;
logic [3:0] Rd_Address = 0;
logic [31:0] Rn, Rs, Rm, Rd, Rd_data, PC_out, PC_next;

reg_file_test1 n1 (clk, write_enable_ARd, Rn_Address, Rs_Address, Rm_Address, Rd_Address, d_data, Rn, Rs, Rm, Rd, PC_out, PC_next);

always begin 
 #1 clk = ~clk;
end

initial begin
	#10 
	Rn_Address = 3;
	Rs_Address = 4;
	Rm_Address = 5;
	Rd_Address = 6;
	Rd_data = 173;
	PC_next = 4;
	Rd_data = 34;
	write_enable_ARd = 1; // enable

	#10 
	Rd_data = 38;
	PC_next = 5;
	write_enable_ARd = 0; // disable

	#10 
	PC_next = 6;
	write_enable_ARd = 1; // enable

	#10 
	Rd_data = 125;
	PC_next = 7;
	Rd_Address = 7;

end

endmodule