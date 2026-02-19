// Source for constants: https://gbdev.io/pandocs/Hardware_Reg_List.html
// Note: Only listed registers available on the DMG version of the GameBoy.

// Hardware Register Addresses ===================================================

// Misc
parameter HARDWARE_REGISTER_ADDRESS_P1_JOYP        = 16'hFF00; // Joypad
parameter HARDWARE_REGISTER_ADDRESS_SB             = 16'hFF01; // Serial transfer data
parameter HARDWARE_REGISTER_ADDRESS_SC             = 16'hFF02; // Serial transfer control
parameter HARDWARE_REGISTER_ADDRESS_DIV            = 16'hFF04; // Divider register
parameter HARDWARE_REGISTER_ADDRESS_TIMA           = 16'hFF05; // Timer counter
parameter HARDWARE_REGISTER_ADDRESS_TMA            = 16'hFF06; // Timer modulo
parameter HARDWARE_REGISTER_ADDRESS_TAC            = 16'hFF07; // Timer control
parameter HARDWARE_REGISTER_ADDRESS_IF             = 16'hFF0F; // Interrupt flag

// Sound
parameter HARDWARE_REGISTER_ADDRESS_NR10           = 16'hFF10; // Sound channel 1 sweep
parameter HARDWARE_REGISTER_ADDRESS_NR11           = 16'hFF11; // Sound channel 1 length timer & duty cycle
parameter HARDWARE_REGISTER_ADDRESS_NR12           = 16'hFF12; // Sound channel 1 volume & envelope
parameter HARDWARE_REGISTER_ADDRESS_NR13           = 16'hFF13; // Sound channel 1 period low
parameter HARDWARE_REGISTER_ADDRESS_NR14           = 16'hFF14; // Sound channel 1 period high & control
parameter HARDWARE_REGISTER_ADDRESS_NR21           = 16'hFF16; // Sound channel 2 length timer & duty cycle
parameter HARDWARE_REGISTER_ADDRESS_NR22           = 16'hFF17; // Sound channel 2 volume & envelope
parameter HARDWARE_REGISTER_ADDRESS_NR23           = 16'hFF18; // Sound channel 2 period low
parameter HARDWARE_REGISTER_ADDRESS_NR24           = 16'hFF19; // Sound channel 2 period high & control
parameter HARDWARE_REGISTER_ADDRESS_NR30           = 16'hFF1A; // Sound channel 3 DAC enable
parameter HARDWARE_REGISTER_ADDRESS_NR31           = 16'hFF1B; // Sound channel 3 length timer
parameter HARDWARE_REGISTER_ADDRESS_NR32           = 16'hFF1C; // Sound channel 3 output level
parameter HARDWARE_REGISTER_ADDRESS_NR33           = 16'hFF1D; // Sound channel 3 period low
parameter HARDWARE_REGISTER_ADDRESS_NR34           = 16'hFF1E; // Sound channel 3 period high & control
parameter HARDWARE_REGISTER_ADDRESS_NR41           = 16'hFF20; // Sound channel 4 length timer
parameter HARDWARE_REGISTER_ADDRESS_NR42           = 16'hFF21; // Sound channel 4 volume & envelope
parameter HARDWARE_REGISTER_ADDRESS_NR43           = 16'hFF22; // Sound channel 4 frequency & randomness
parameter HARDWARE_REGISTER_ADDRESS_NR44           = 16'hFF23; // Sound channel 4 control
parameter HARDWARE_REGISTER_ADDRESS_NR50           = 16'hFF24; // Master volume & VIN panning
parameter HARDWARE_REGISTER_ADDRESS_NR51           = 16'hFF25; // Sound panning
parameter HARDWARE_REGISTER_ADDRESS_NR52           = 16'hFF26; // Sound on/off
parameter HARDWARE_REGISTER_ADDRESS_WAVE_RAM_START = 16'hFF30; // Storage for one of the sound channels' waveform
parameter HARDWARE_REGISTER_ADDRESS_WAVE_RAM_END   = 16'hFF3F; // ^

// Video
parameter HARDWARE_REGISTER_ADDRESS_LCDC           = 16'hFF40; // LCD control
parameter HARDWARE_REGISTER_ADDRESS_STAT           = 16'hFF41; // LCD status
parameter HARDWARE_REGISTER_ADDRESS_SCY            = 16'hFF42; // Viewport Y position
parameter HARDWARE_REGISTER_ADDRESS_SCX            = 16'hFF43; // Viewport X position
parameter HARDWARE_REGISTER_ADDRESS_LY             = 16'hFF44; // LCD Y coordinate
parameter HARDWARE_REGISTER_ADDRESS_LYC            = 16'hFF45; // LY compare
parameter HARDWARE_REGISTER_ADDRESS_DMA            = 16'hFF46; // OAM DMA source address & start
parameter HARDWARE_REGISTER_ADDRESS_BGP            = 16'hFF47; // BG pallette data
parameter HARDWARE_REGISTER_ADDRESS_OBP0           = 16'hFF48; // OBJ palette 0 data
parameter HARDWARE_REGISTER_ADDRESS_OBP1           = 16'hFF49; // OBJ palette 1 data
parameter HARDWARE_REGISTER_ADDRESS_WY             = 16'hFF4A; // Window Y position
parameter HARDWARE_REGISTER_ADDRESS_WX             = 16'hFF4B; // Window X position plus 7
parameter HARDWARE_REGISTER_ADDRESS_BANK           = 16'hFF50; // Boot ROM mapping control

// Interrupts
parameter HARDWARE_REGISTER_ADDRESS_IE             = 16'hFFFF; // Interrupt enable
