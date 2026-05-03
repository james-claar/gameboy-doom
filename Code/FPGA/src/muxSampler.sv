//
// Repeatedly samples the cartridge inputs using the mux chips.
// Note: Address is not atomic
//

module muxSampler (
    // Control signals
    input fpgaReset,
    input sampleClk,

    // Mux signals
    input muxPins [9:0],
    output wire readMux,

    // Formatted and mapped outputs
    output wire initialized, // Whether the output contains real samples
    output wire gbClk,
    output wire gbRd,
    output wire gbWr,
    output wire gbCs,
    output wire gbAddr [15:0]
);

// State and stored input pins
reg [9:0] storedMuxA = 10'h0000;
reg [9:0] storedMuxB = 10'h0000;
reg readState = 1'b0;
reg init = 1'b0;

// Output mapping
assign readMux = readState;
assign initialized = init;

// Maps from schematic

// Mux A
assign gbClk      = init ?  storedMuxA[0] : 1'b0; // FPGA_4 in schematic
assign gbCs       = init ? ~storedMuxA[1] : 1'b0; // FPGA_5 in schematic
assign gbAddr[15] = init ?  storedMuxA[2] : 1'b0; // FPGA_7 in schematic
assign gbAddr[14] = init ?  storedMuxA[3] : 1'b0; // FPGA_8 in schematic
assign gbAddr[13] = init ?  storedMuxA[4] : 1'b0; // FPGA_9 in schematic
assign gbAddr[12] = init ?  storedMuxA[5] : 1'b0; // FPGA_10 in schematic
assign gbAddr[11] = init ?  storedMuxA[6] : 1'b0; // FPGA_11 in schematic
assign gbRd       = init ? ~storedMuxA[7] : 1'b0; // FPGA_12 in schematic
assign gbAddr[10] = init ?  storedMuxA[8] : 1'b0; // FPGA_13 in schematic
assign gbAddr[9]  = init ?  storedMuxA[9] : 1'b0; // FPGA_14 in schematic

// Mux B
assign gbWr       = init ? ~storedMuxB[0] : 1'b0; // FPGA_4 in schematic
assign gbAddr[0]  = init ?  storedMuxB[1] : 1'b0; // FPGA_5 in schematic
assign gbAddr[1]  = init ?  storedMuxB[2] : 1'b0; // FPGA_7 in schematic
assign gbAddr[2]  = init ?  storedMuxB[3] : 1'b0; // FPGA_8 in schematic
assign gbAddr[3]  = init ?  storedMuxB[4] : 1'b0; // FPGA_9 in schematic
assign gbAddr[4]  = init ?  storedMuxB[5] : 1'b0; // FPGA_10 in schematic
assign gbAddr[5]  = init ?  storedMuxB[6] : 1'b0; // FPGA_11 in schematic
assign gbAddr[6]  = init ?  storedMuxB[7] : 1'b0; // FPGA_12 in schematic
assign gbAddr[7]  = init ?  storedMuxB[8] : 1'b0; // FPGA_13 in schematic
assign gbAddr[8]  = init ?  storedMuxB[9] : 1'b0; // FPGA_14 in schematic


// Controller loop
always @(posedge sampleClk or posedge fpgaReset) {
    if (fpgaReset) begin
        storedMuxA <= 10'h0000;
        storedMuxB <= 10'h0000;
        readState <= 1'b0;
        initializedState <= 1'b0;
    end else begin
        if (!readState) begin
            storedMuxA <= muxPins;
        end else begin
            storedMuxB <= muxPins;
            initializedState <= 1'b1;
        end

        readState <= ~readState;
    end
}

endmodule
