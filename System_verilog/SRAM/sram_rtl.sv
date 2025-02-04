module sram (clk, reset, write_en, read_en, write_data, read_data, addr);

input bit clk, reset;
input logic write_en, read_en;
input logic [31:0] write_data;
input logic [3:0] addr;
output logic [31:0] read_data;

bit [31:0]mem[9:0] ;
integer i ;

always @ (posedge clk)
begin
	if (reset)
		begin
			read_data <= 0;
		for (i=0; i < $size(mem);i++)
			begin
				mem[i] <= 0;
			end
		end
	else
		begin
			if (write_en && !read_en)
				begin
					mem[addr] <= write_data;
				end
			if (!write_en && read_en)	
				begin
					read_data <= mem[addr] ;
				end	
		end	
end
endmodule
