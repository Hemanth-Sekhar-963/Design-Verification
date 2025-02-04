`include "environment.sv"

program test(intf intff);
	environment env;

initial begin
	wait (intff.reset == 0);
	env = new(intff);
	env.test_run();
end

endprogram
