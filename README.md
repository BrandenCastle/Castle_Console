# Castle_Console
16-Bit Console which will feature full audio, HDMI video, a small livrary of included games, and possible future controller support.


#  Castle Console (FPGA-Based Game System)

## Overview
The Castle Console is a custom-built FPGA game system designed to explore low-level hardware design, real-time graphics generation, and digital system architecture. Built using Verilog and deployed on a Xilinx-based development board, this project demonstrates how a game console can be constructed from fundamental components such as a CPU, GPU, and video pipeline.

## Current Features

###  HDMI Connectivity
The system outputs video directly over HDMI using a hardware-based rendering pipeline. A timing generator produces synchronization signals and pixel coordinates, while a custom pixel generator determines the color of each pixel in real time. The signal is encoded using an RGB-to-DVI/HDMI encoder IP core and displayed on an external monitor.

## Planned Features

###  Game Library
A small library of games will be supported by the system, running on a custom CPU architecture. The design is modular, allowing new games to be added by updating instruction memory and game logic.

### Sound
Future versions of the console will include audio support for generating tones and sound effects. This may be implemented using techniques such as PWM or waveform lookup tables, synchronized with gameplay events.

###  Controller Support
Controller and input support will be added to enable real-time user interaction. This includes handling button inputs and potentially expanding to external controller interfaces.

## Hardware Architecture

### Clocking System
A Clock Wizard IP core is used to generate the required internal clocks from the board’s base clock. These include:
- A pixel clock for video rendering
- A high-speed serial clock for HDMI transmission

### HDMI Pipeline
- Timing Generator: Produces sync signals and pixel coordinates
- Pixel Generator (GPU): Determines pixel color and animation
- RGB to DVI Encoder: Converts RGB to HDMI TMDS signals

### GPU
Handles real-time rendering using coordinate-based logic and frame-synchronized updates.

### CPU
Custom processor with instruction memory, register file, ALU, and FSM (Fetch → Execute → Write).

## Future Improvements
- Sprite/tile rendering
- Expanded game library
- Audio system
- Controller integration
