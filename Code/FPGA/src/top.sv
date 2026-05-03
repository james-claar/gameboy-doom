

module top (
    // FPGA internal
    input fpgaClk,

    // Direct connections to cartridge pins
    inout gbResetInverted,

    // GB <-> cartridge data transfer
    // through voltage level shifter
    inout [7:0] gbData,

    // Mux controls and data pins
    output readMuxToggle,
    input gbMuxFPGA[9:0], // For pin mapping, see muxSampler.v

    // Audio output (through poor man's DAC)
    output audio,

    // Debug USB interface
    // (unused)
    // Note: The original cartridge designer (Synogate) did
    // not add a USB PHY controller to the design, and
    // just directly connected the USB data lines to the
    // FPGA pins. As such, this port is completely unusable.

    // SD card slot
    inout sdData[0:3],
    inout sdCommand,
    output sdClk
);

wire fpgaReset = 1'b0;

wire gbResetWriteOnly = 1'b0;
wire gbResetReadOnly = ~gbResetInverted;


// Sample the cartridge interface inputs using the mux chips
wire muxesInitialized;
wire gbClock;
wire gbRead;
wire gbWrite;
wire gbChipSelect;
wire gbAddress [15:0];
muxSampler muxSampler(
    // Control signals
    .fpgaReset(fpgaReset),
    .sampleClk(fpgaClk),

    // Mux signals
    .muxPins(gbMuxFPGA),
    .readMux(readMux),

    // Formatted and mapped outputs
    .initialized(muxesInitialized),
    .gbClk(gbClock),
    .gbRd(gbRead),
    .gbWr(gbWrite),
    .gbCs(gbChipSelect),
    .gbAddr(gbAddress)
)


endmodule