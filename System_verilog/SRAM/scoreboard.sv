class scoreboard;

    // Internal reference memory model
    bit [31:0] ref_mem [9:0]; // Matches the DUT memory size

    // Mailbox to receive transactions from the monitor
    mailbox mon2scb;

    // Constructor
    function new(mailbox mon2scb);
        this.mon2scb = mon2scb;
    endfunction

    // Task to process and verify transactions
    task main();
        transaction trans;

        // Initialize reference memory
        foreach (ref_mem[i]) ref_mem[i] = 0;

        // Continuous transaction processing
        forever begin
            // Get a transaction from the monitor
            mon2scb.get(trans);

            // If reset is active, reset the reference memory
            if (trans.reset) begin
                $display("Scoreboard: Reset detected. Clearing reference memory...");
                foreach (ref_mem[i]) ref_mem[i] = 0;
            end else begin
                // Handle write operation
                if (trans.write_en && !trans.read_en) begin
                    ref_mem[trans.addr] <= trans.write_data;
                    $display("Scoreboard: Write Addr=%0d, Data=%h, ref_mem[%0d]=%0h", trans.addr, trans.write_data,trans.addr,ref_mem[trans.addr]);
                end

                // Handle read operation
                if (trans.read_en && !trans.write_en) begin
                    bit [31:0] expected_data = ref_mem[trans.addr];

                    if (trans.read_data === expected_data) begin
			trans.display("PASS - Scoreboard class signals") ;                       
// $display("Scoreboard: PASS - Addr=%0d, Expected=%h, Got=%h",trans.addr, expected_data, trans.read_data);
                    end else begin
			trans.display("FAIL-Score board class signals") ;                       
 //$error("Scoreboard: FAIL - Addr=%0d, Expected=%h, Got=%h",trans.addr, expected_data, trans.read_data);
                    end
                end
            end
        end
    endtask

endclass

