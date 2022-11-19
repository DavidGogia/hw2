module reg_file_test1(
	// inputs
	input clk,
	input [3:0] write_enable_ARd, Rn_Address, Rs_Address, Rm_Address, Rd_Address,
	// ouputs
	output [31:0] Rd_data, Rn, Rs, Rm, Rd,
	// PC
	output [31:0] PC_out,
	input [31:0] PC_next
);

logic [31:0] register_f [15:0];
									
assign Rn = register_f [Rn_Address];
assign Rs = register_f [Rs_Address];
assign Rm = register_f [Rm_Address];
assign Rd = register_f [Rd_Address];
assign PC_out = register_f [15];

always @(posedge clk) begin
	register_f [15] <= PC_next;
	if (write_enable_ARd == 1) register_f[Rd_Address] = Rd_data;
end

endmodule