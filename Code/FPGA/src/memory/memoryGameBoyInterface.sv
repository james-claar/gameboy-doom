

module memoryGameBoyInterface(
    // Control signals
    input fpgaReset,
    input fpgaClock,

    // Cartridge pin signals (we are slaved to the GameBoy)
    input gbAddr [15:0],
    input gbClock,
    input gbRead,
    input gbWrite,
    input gbChipSelect,
    input gbDataFpgaIn [7:0],
    output gbDataFpgaOut [7:0],
    output gbDataFpgaOutEnable

    // FPGA internal
    output wire fpgaAddr [15:0],
    output wire fpgaReadControl,
    input fpgaReadData [7:0],
    output wire fpgaWriteControl,
    output wire fpgaWriteData [7:0],
    input fpgaWriteDone
)

// Insights:
// Whenever read is high and A15 != ~CS, we should be providing data
// Whenever write is high, we should be receiving data

assign gbDataFpgaOut = 


endmodule
