
// VRAM tile data memory mapping

// Tile blocks
// See https://gbdev.io/pandocs/Tile_Data.html
parameter VRAM_TILE_DATA_0_START   = 16'h8000;
parameter VRAM_TILE_DATA_0_END     = 16'h87FF;
parameter VRAM_TILE_DATA_1_START   = 16'h8800;
parameter VRAM_TILE_DATA_1_END     = 16'h8FFF;
parameter VRAM_TILE_DATA_2_START   = 16'h9000;
parameter VRAM_TILE_DATA_2_END     = 16'h97FF;

// Tile maps
// See https://gbdev.io/pandocs/Tile_Maps.html
parameter VRAM_TILE_MAP_0_START  = 16'h9800;
parameter VRAM_TILE_MAP_0_END    = 16'h9BFF;
parameter VRAM_TILE_MAP_1_START  = 16'h9C00;
parameter VRAM_TILE_MAP_1_END    = 16'h9FFF;
