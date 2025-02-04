module spi_master #(
    parameter DATA_WIDTH = 8
)(
    input  logic clk,              // Clock signal
    input  logic reset,            // Active-high reset
    input  logic start,            // Start transaction
    input  logic [DATA_WIDTH-1:0] data_in, // Data to transmit
    output logic [DATA_WIDTH-1:0] data_out, // Received data
    output logic sclk,             // SPI clock
    output logic mosi,             // Master Out Slave In
    input  logic miso,             // Master In Slave Out
    output logic cs                // Chip Select (active low)
);

    // Internal signals
    logic [DATA_WIDTH-1:0] shift_reg; // Shift register for data
    logic [2:0] bit_count;          // Bit counter
    logic busy;                     // Busy flag

    // SPI clock generation (divide system clock by 2)
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            sclk <= 1'b0;
        end else begin
            sclk <= ~sclk;
        end
    end

    // SPI transaction logic
    always_ff @(posedge sclk or posedge reset) begin
        if (reset) begin
            shift_reg <= 'b0;
            bit_count <= 'b0;
            cs <= 1'b1; // Deactivate chip select
            busy <= 1'b0;
        end else if (start && !busy) begin
            shift_reg <= data_in; // Load data into shift register
            bit_count <= DATA_WIDTH;
            cs <= 1'b0; // Activate chip select
            busy <= 1'b1;
        end else if (busy) begin
            if (bit_count > 0) begin
                // Shift out MOSI and shift in MISO
                mosi <= shift_reg[DATA_WIDTH-1];
                shift_reg <= {shift_reg[DATA_WIDTH-2:0], miso};
                bit_count <= bit_count - 1;
            end else begin
                cs <= 1'b1; // Deactivate chip select
                busy <= 1'b0;
                data_out <= shift_reg; // Capture received data
            end
        end
    end

endmodule
