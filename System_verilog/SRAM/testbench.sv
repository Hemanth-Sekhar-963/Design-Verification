`include "interface.sv"
`include "test.sv"

module testbench;

  
	intf intff();  //interface
	test tst (intff);  //test

sram DUT(
.write_en(intff.write_en),
.read_en(intff.read_en),
.write_data(intff.write_data),
.read_data(intff.read_data),
.addr(intff.addr),
  .clk(intff.clk),
  .reset(intff.reset)
);

    // Clock generation
    initial begin
        intff.clk = 0;
        forever #5 intff.clk = ~intff.clk;
    end

    // Clock generation
    initial begin
        intff.reset = 1;
        #20 intff.reset = 0;
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
 end
  
endmodule