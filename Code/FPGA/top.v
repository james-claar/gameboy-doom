

module top (
    // FPGA
    input fpgaClk,
    input fpgaReset,

    // Cartridge pins
    input gbClk,
    input gbWriteInverted,
    input gbReadInverted,
    input gbChipSelectInverted,
    input [15:0] gbAddress,

    inout [7:0] gbData,
    inout gbResetInverted
);

wire gbWrite = ~gbWriteInverted;
wire gbRead = ~gbReadInverted;
wire gbChipSelect = ~gbChipSelectInverted;
wire gbResetReadOnly = ~gbResetInverted;



endmodule