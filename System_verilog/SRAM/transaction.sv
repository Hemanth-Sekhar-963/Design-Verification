class transaction;        //packet class
	rand logic [31:0]write_data;
	randc logic [3:0] addr;
	rand logic write_en;
	rand logic read_en;
	
	bit clk;
	bit reset;
	logic [31:0]read_data;  //cannot randomize as it is output

//constraint EN {write_en != read_en;}
function void display (string name); //just display func to call from all TB components and display values
$display("___________%s___________", name);
$display("addr = %0h, write_data = %0h, read_data = %0h, write_en = %0b, read_en = %0b", addr, write_data, read_data, write_en, read_en );
$display("........................");
endfunction

endclass