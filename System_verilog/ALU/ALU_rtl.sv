module alu #(parameter WIDTH = 8) (
    input  logic             clk,        // Clock signal
    input  logic             reset,      // Reset signal (active high)
    input  logic [WIDTH-1:0] a, b,       // Input operands
    input  logic [2:0]       op,         // Operation code
    output logic [WIDTH-1:0] result,     // Output result
    output logic             zero_flag   // Zero flag (1 if result is zero)
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            result <= 'b0;               // Clear result on reset
            zero_flag <= 1'b1;           // Set zero flag on reset
        end else begin
            case (op)
                3'b000: result <= a + b; // Addition
                3'b001: result <= a - b; // Subtraction
                3'b010: result <= a & b; // Bitwise AND
                3'b011: result <= a | b; // Bitwise OR
                3'b100: result <= a ^ b; // Bitwise XOR
                default: result <= 'b0;  // Default case (result = 0)
            endcase

            // Zero flag logic
            zero_flag <= (result == 0);
        end
    end

endmodule
