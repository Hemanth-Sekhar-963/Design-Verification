interface intf();

	bit clk;
	bit reset;
	logic write_en;
	logic read_en;
	logic [31:0] write_data;
	logic  [31:0] read_data;
	logic [3:0] addr;

//clocking block
//modport


endinterface