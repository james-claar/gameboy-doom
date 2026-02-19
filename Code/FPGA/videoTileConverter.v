// Converts a video frame into GameBoy tiles.
// See: https://gbdev.io/pandocs/Tile_Data.html

parameter W = 160; // Width of screen in pixels
parameter H = 144; // Height of screen in pixels
parameter WT = 20; // Width of screen in tiles
parameter HT = 18; // Height of screen in tiles

module videoTileConverter (
    input [W-1:0][H-1:0][1:0] frame,
    output wire [(WT * HT)-1:0][127:0] tiles
);

genvar x;
genvar y;
genvar isHighBit;
generate
    for (x = 0; x < W; x++) begin
        for (y = 0; y < H; y++) begin
            for (isHighBit = 0; isHighBit < 2; isHighBit++) begin
                assign tiles[(x >> 3) + (WT * (y >> 3))][
                              (7 - (x & 16'h0007))
                            + (16 * (y & 16'h0007))
                            + (8 * isHighBit)
                        ] = frame[x][y][isHighBit]
            end
        end
    end
endgenerate

endmodule