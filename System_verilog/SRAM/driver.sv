class driver;
virtual intf vif; //interface is static, class is dynamic, so virtual //vif pointing to actual interface

mailbox gen2drv;

function new (virtual intf vif, mailbox gen2drv); //constructor
this.vif = vif;
this.gen2drv = gen2drv ;
endfunction

task main();

repeat(2)
begin 

transaction trans ;
gen2drv.get(trans);

vif.write_en <= trans.write_en ;
vif.read_en <= trans.read_en ;
vif.write_data <= trans.write_data ;
vif.addr <= trans.addr ;
vif.clk <=trans.clk ;
vif.reset <= trans.reset ;
#10

trans.read_data = vif.read_data ;
#10
trans.display("Driver class signals");

end
endtask
endclass