# DOOM for the GameBoy

Note: This project is work-in-progress and not yet complete.

### Description
This project is an unofficial Nintendo GameBoy cartridge designed to run Dom (1993) on an original GameBoy at a reasonable frame rate. Once this project is finished, anyone with basic surface-mount soldering skills and minimal programming knowledge should be able to build their own using the documentation on this GitHub repo.

### Implmentation Details
The custom cartridge runs Doom on its own and streams video data to the GameBoy, instead of running it on the GameBoy's processor.

Here's a diagram showing data flow from the player pressing a button, to displaying fully rendered video data on the GameBoy's screen:

<br>

![Dataflow Block Diagram](https://github.com/james-claar/gameboy-doom/blob/main/Documentation/Images/DataflowBlockDiagram.png)

More details WIP

### Credits
Something very similar to this project has already been made open source by Synogate, who wrote a [blog post](https://www.synogate.com/blog/2024/bfc_doom_soc_intro.html) about it.

However, as of April 2026, I could not find any up-to-date documentation on how to build and program one yourself, which is why I created this project.


### Disclaimer
As mentioned in the license, I take no responsibility for any damaged hardware (GameBoys) that may result from building this project and plugging it into a GameBoy.
**Build this at your own risk.**

