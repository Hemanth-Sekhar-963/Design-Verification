/*Design a SystemVerilog class that models a packet generator for a communication system. The packet should have the following randomized fields, each with different constraints. You will explore various randomization scenarios like range constraints, exclusion, weighted distribution, dependency constraints, and soft constraints.

Problem Breakdown
Your Packet class should have the following fields:

Packet ID (pkt_id)
8-bit random integer
Must always be greater than 100 and less than 500
Even numbers only
 
Packet Size (size)
6-bit random integer
Must be between 32 and 128 bytes
Must not be 64 or 96

Packet Type (type)
Enum {DATA, ACK, CONTROL, ERROR}
Distribution: DATA (50%), ACK (20%), CONTROL (20%), ERROR (10%)

Destination Address (dest_addr)
16-bit random integer
Should always be less than 1024
If type == ERROR, dest_addr should be 0

Priority (priority)
2-bit random value {0, 1, 2, 3}
If size > 100, priority should be only 2 or 3
If pkt_id is a multiple of 5, priority should be 0

Checksum (checksum)
8-bit random integer
Soft constraint: Prefer values below 50, but allow up to 255
*/


class packet;
    rand bit [7:0] pkt_id;
    rand bit [5:0] size;
    typedef enum {DATA, ACK, CONTROL, ERROR} pkt_type;
    rand pkt_type ptype;
    rand bit [15:0] dest_addr;
    rand bit [1:0] prioriti;
    rand bit [7:0] checksum;

    constraint c_pkt_id { pkt_id inside {[100:500]}; pkt_id%2 ==0; }
    constraint c_size { size inside {[32:128]}; size != 64 ; size != 96 ;}
    constraint c_pkt_type { ptype dist {DATA := 50, ACK := 20, CONTROL := 20 , ERROR :=10 };}
    constraint c_dest_addr { dest_addr < 1024 ; if (ptype == ERROR) dest_addr ==0;}
    constraint c_priority { if (size > 100) prioriti inside {[2:3]};}
    constraint c_checksum {soft checksum < 50 ;}

endclass


module packet_tb;

initial begin
    packet pkt = new();
    
    repeat(20)
    begin
    pkt.randomize();
    $display("pkt_id: %0d,size: %0d,ptype: %0s,dest_addr: %0d,prioriri: %0d,checksum: %0d", pkt.pkt_id, pkt.size, pkt.ptype, pkt.dest_addr , pkt.prioriti, pkt.checksum);
end
end
endmodule

