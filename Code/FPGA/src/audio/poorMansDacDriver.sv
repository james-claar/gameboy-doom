//
// Drives a "Poor Man's D/A Converter" using PWM
//
// Current design:
//
// V_in --- R ---+--> V_out (preamp)
//               |
//               C
//               |
//              GND
//
// Where V_in is our PWM output pin and V_out goes
// to a high-impedance load.
//
// FPGA pin output current should be < 4 mA, so we choose
// R = 1 kOhm   (3.3 V / 1 kOhm = 3.3 mA)
// C = 2.2 nF

