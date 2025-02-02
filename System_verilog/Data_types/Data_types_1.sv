/* Hemanth_Sekhar
   "Hard work is worthless who doesn't believe in themselves" 
   - Naruto Uzumaki
*/

// Topic- Data_types_in_System_verilog

module data_types;

  
  reg reg_type;
  wire wire_type;
  integer integer_type;
  real real_type;
  time time_type;
  realtime realtime_type;
  logic logic_type;
  bit bit_type;
  byte byte_type;
  shortint shortint_type;
  int int_type;
  longint longint_type;
  shortreal shortreal_type;

  
  function automatic bit check_signed(input integer data);
    begin
      if (data < 0)
        check_signed = 1;  // Signed
      else
        check_signed = 0;  // Unsigned
    end
  endfunction

  initial begin
    
    $display("reg_type:       Default value : %0b | Size : %0d | Signed: 0", reg_type, $bits(reg_type));
    $display("wire_type:      Default value : %0b | Size : %0d | Signed: 0", wire_type, $bits(wire_type));
    $display("integer_type:   Default value : %0d | Size : %0d | Signed: 1", integer_type, $bits(integer_type));
    $display("real_type:      Default value : %0f | Size : %0d | Signed: N/A", real_type, $bits(real_type)); 
    $display("time_type:      Default value : %0t | Size : %0d | Signed: N/A", time_type, $bits(time_type)); 
    $display("realtime_type:  Default value : %0f | Size : %0d | Signed: N/A", realtime_type, $bits(realtime_type)); 
    $display("logic_type:     Default value : %0b | Size : %0d | Signed: 0", logic_type, $bits(logic_type));
    $display("bit_type:       Default value : %0b | Size : %0d | Signed: 0", bit_type, $bits(bit_type));
    $display("byte_type:      Default value : %0b | Size : %0d | Signed: 0", byte_type, $bits(byte_type));
    $display("shortint_type:  Default value : %0d | Size : %0d | Signed: 1", shortint_type, $bits(shortint_type));
    $display("int_type:       Default value : %0d | Size : %0d | Signed: 1", int_type, $bits(int_type));
    $display("longint_type:   Default value : %0d | Size : %0d | Signed: 1", longint_type, $bits(longint_type));
    $display("shortreal_type: Default value : %0f | Size : %0d | Signed: N/A", shortreal_type, $bits(shortreal_type)); 


    $display("1. real and shortreal are floating-point types in SystemVerilog, and they do not have a signed or unsigned property
They represent real numbers and are inherently signed because floating-point numbers have both positive and negative values
However, they are not explicitly labeled as signed or unsigned in the same way integer types are, because they represent values with a fractional component, not just whole numbers.
2. time and realtime are SystemVerilog types designed to hold time values.
time is used for simulation time and can hold values like ticks or time units, while realtime can hold real-time values with floating-point precision.
Neither of these types is signed or unsigned since they are not used to represent numerical quantities in the way that integers or real numbers are.");


/*
They represent real numbers and are inherently signed because floating-point numbers have both positive and negative values
However, they are not explicitly labeled as signed or unsigned in the same way integer types are, because they represent values with a fractional component, not just whole numbers.
2. time and realtime are SystemVerilog types designed to hold time values.
time is used for simulation time and can hold values like ticks or time units, while realtime can hold real-time values with floating-point precision.
Neither of these types is signed or unsigned since they are not used to represent numerical quantities in the way that integers or real numbers are.*/
  end

endmodule

