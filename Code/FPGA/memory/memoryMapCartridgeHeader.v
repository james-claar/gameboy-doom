// ROM for cartridge header. Since it's only 80 bytes, we can fit this here.

// See https://gbdev.io/pandocs/The_Cartridge_Header.html



module memoryMapCartridgeHeader (
    input addr,
    output wire inRange,
    output wire [7:0] data
);

localparam START_ADDRESS = 16'h0100;
localparam END_ADDRESS = 16'h014F;
localparam RANGE_SIZE = END_ADDRESS + 1 - START_ADDRESS;

localparam INSTRUCTION_NOP = 8'h00; // "nop" 8080 instruction
localparam INSTRUCTION_JP_0150 = 24'hF25001; // "jp $0150" 8080 instruction
localparam ENTRY_INSTRUCTIONS = {INSTRUCTION_NOP, INSTRUCTION_JP_0150}

// Nintendo logo (this is ok under copyright law
// since it is required for the game to work)
localparam NINTENDO_LOGO = {
    128'hCEED6666CC0D000B03730083000C000D,
    128'h0008111F8889000EDCCC6EE6DDDDD999,
    128'hBBBB67636E0EECCCDDDC999FBBB9333E
}

localparam TITLE = 128'h444F4F4D000000000000000000000000; // "DOOM" in ASCII
localparam NEW_LICENSEE_CODE = 16'h3030; // "00" in ASCII, for "None"
localparam SGB_FLAG = 8'h00; // Super GameBoy not supported
localparam CARTRIDGE_TYPE = 8'h00; // ROM only (no MBC mapping)
localparam ROM_SIZE = 8'h00; // 32 KiB
localparam RAM_SIZE = 8'h00; // No RAM
localparam DESTINATION_CODE = 8'h00; // Japan (and possibly overseas)
localparam OLD_LICENSEE_CODE = 8'h00; // None
localparam MASK_ROM_VERSION_NO = 8'h00; // Version 0 of the game
localparam GLOBAL_CHECKSUM = 16'h0000; // Not checked, so we can leave it as zero

localparam [615:0] HEADER_DATA_NO_CHECKSUM = {
    ENTRY_INSTRUCTIONS,                   // 0100-0103
    NINTENDO_LOGO,                        // 0104-0133
    TITLE,                                // 0134-0143
    NEW_LICENSEE_CODE,                    // 0144-0145
    SGB_FLAG,                             // 0146
    CARTRIDGE_TYPE,                       // 0147
    ROM_SIZE,                             // 0148
    RAM_SIZE,                             // 0149
    DESTINATION_CODE,                     // 014A
    OLD_LICENSEE_CODE,                    // 014B
    MASK_ROM_VERSION_NO                   // 014C
}

localparam [639:0] HEADER_DATA = {
    HEADER_DATA_NO_CHECKSUM,              // 0100-014C
    getChecksum(HEADER_DATA_NO_CHECKSUM), // 014D
    GLOBAL_CHECKSUM                       // 014E-014F
};

assign inRange = (addr >= START_ADDRESS) && (addr <= END_ADDRESS);
wire [15:0] offsetAddr = addr - START_ADDRESS;
assign data = inRange ? HEADER_DATA[(8*offsetAddr)+7:(8*offsetAddr)] : 8'h00;

function automatic [7:0] getChecksum (input [615:0] data);
    integer i;
    reg [7:0] checksum;
begin
    checksum = 8'd0;
    for (i = 0; i < RANGE_SIZE - 3; i = i + 1) begin
        checksum = checksum - data[((8*i)+7):(8*i)] - 1
    end
    getChecksum = sum;
end
endfunction

endmodule