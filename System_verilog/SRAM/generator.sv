class generator;
	transaction trans; //randomize trans signals
	mailbox gen2drv ; //mailbox to generator to driver

function new (mailbox gen2drv); //new is a constructor,when you call constructor, it creates memory for generator class and allocate memory for variables and initialize with default values
	this.gen2drv = gen2drv ;
endfunction

task main();


begin
trans = new(); //creating object of transaction class
trans.randomize() with {write_en==1;read_en ==0;addr == 'b0010;}; //it randomize the trans signals declared with rand keyword in transaction class ---inline constraint - if we are using with
trans.display("Generator class signals"); //calling display function to display values

gen2drv.put(trans); //put the transaction data into mailbox

end

begin
trans = new(); //creating object of transaction class
trans.randomize() with {read_en ==1;write_en==0;addr == 'b0010;}; //it randomize the trans signals declared with rand keyword in transaction class
trans.display("Generator class signals"); //calling display function to display values

gen2drv.put(trans); //put the transaction data into mailbox

end

endtask
endclass