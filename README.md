# DOOM for the GameBoy

Note: This project is work-in-progress and not yet complete.

### Description
This project is an unofficial Nintendo GameBoy cartridge designed to run Dom (1993) on an original GameBoy at a reasonable frame rate. Once this project is finished, anyone with basic surface-mount soldering skills and minimal programming knowledge should be able to build their own using the documentation on this GitHub repo.

### Required Parts

| #    | Name                    | Technical Name / Notes                                                                                            |
|------|-------------------------|-------------------------------------------------------------------------------------------------------------------|
| 1    | Custom PCB              | Required manufacturing parameters: <ul> <li> Thickness: 0.8 mm </li> <li> Surface finish: ENIG </li> <li> Gold Fingers </li> </ul> |
| 1    | MicroSD Card            | At least 8 MB capacity                                                                                            |
| 1    | FPGA Dev Board          | Max1000, 16k LE, 32 MByte RAM, 8 MByte Flash                                                                      |
| 1    | USB Port                | Molex 475900001                                                                                                   |
| 1    | MicroSD Card Slot       | Molex 472192001                                                                                                   |
| 3    | Multiplexer             | LVC257A                                                                                                           |
| 1    | Voltage Level Shifter   | TXB0108PWR                                                                                                        |
| 1    | Op-Amp                  | LMV321                                                                                                            |
| 1    | Larger Capacitor        | 100 uF tantalum capacitor size 3528                                                                               |
| N/A  | Generic SMD Resistors   | Size 0603 SMD resistors standard values (see BOM on GitHub for amount and values)                                 |
| N/A  | Generic SMD Capacitors  | Size 0603 SMD capacitors standard values (see BOM on GitHub for amount and values)

### Build Instructions
<ol>
    <li> Order all the required parts from the "Required Parts" table above. </li>
    <ol type="a">
        <li> Make sure to select the listed parameters for the PCB. </li>
    </ol>
    <li> Assemble the PCB using the BOM as a guide for component placement. </li>
    <li> Download all necessary software. </li>
    <ol type="a">
        <li> Install Intel Quartus Prime 21.1 Lite Edition. </li>
        <ol type="i">
            <li> As of writing, this is the latest version that supports the Max1000. </li>
            <li> During installation, check the box for the Max10 family of FPGAs. </li>
        </ol>
        <li> Download the “Code” folder from the GitHub repo. </li>
    </ol>
    <li> Program the Max1000 with the latest GameBoy DOOM software. </li>
    <ol type="a">
        <li> Connect the cartridge to a USB port on your computer. </li>
        <li> Open the project <code>Code/FPGA/GameBoyDoom.qpf</code> using Quartus. </li>
        <li> In Quartus, open the Programmer, select the board, and program it. </li>
        <li> Unplug the cartridge from USB. </li>
    </ol>
    <li> Copy <code>Code/DOOM/GameData/DOOM1.WAD</code> to the MicroSD card, then insert it into the cartridge’s SD card slot. </li>
    <ol type="a">
        <li> You may need to format the card to FAT32. </li>
        <li> This is the free shareware version of the DOOM game data, containing only the first level. If you own a copy of DOOM, you may use your own version. </li>
    </ol>
    <li> The cartridge is ready to be inserted into the GameBoy. </li>
</ol>

Please note that these instructions have not been verified to work. I haven't even assembled the prototype cartridge yet, so this is just my best guess.

### Implmentation Details
The custom cartridge runs Doom on its own and streams video data to the GameBoy, instead of running it on the GameBoy's processor.

Here's a diagram showing data flow from the player pressing a button, to displaying fully rendered video data on the GameBoy's screen:

<br>

![Dataflow Block Diagram](https://github.com/james-claar/gameboy-doom/blob/main/Documentation/Images/DataflowBlockDiagram.png)

<br>

This is a generalized schematic for the cartridge, showing data flow between the GameBoy and the Max1000. For the full schematic, open the KiCad project under `Physical/Synogate/gameboy-fpga-cartridge/gbCartridge/gbCartridge.pro`.

<br>

![Simplified Cartridge Schematic](https://github.com/james-claar/gameboy-doom/blob/main/Documentation/Images/SimplifiedCartridgeSchematic.png)

More details WIP

### Credits
Something very similar to this project has already been made open source by Synogate, who wrote a [blog post](https://www.synogate.com/blog/2024/bfc_doom_soc_intro.html) about it.

However, as of April 2026, I could not find any up-to-date documentation on how to build and program one yourself, which is why I created this repo.


### Disclaimer
As mentioned in the license, I take no responsibility for any damaged hardware (GameBoys) that may result from building this project and plugging it into a GameBoy.
**Build this at your own risk.**

