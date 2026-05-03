//
// Cartridge memory interface
//

module memory (
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
    output gbDataFpgaOutEnable,

    // Shared memory interface

    // Exports

)

// State variables



endmodule
