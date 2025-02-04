class monitor;

virtual intf vif;
mailbox mon2scb;


function new (virtual intf vif, mailbox mon2scb );
this.vif=vif;
this.mon2scb=mon2scb;
endfunction

task main();
repeat(2)
#10
begin

transaction trans;
trans = new();

trans.write_en = vif.write_en ;
trans.read_en = vif.read_en ;
trans.write_data = vif.write_data ;
trans.addr = vif.addr ;
trans.clk = vif.clk ;
trans.reset = vif.reset ;
trans.read_data = vif.read_data ;

mon2scb.put(trans);
#10
trans.display("Monitor class signals") ;

end
endtask
endclass
