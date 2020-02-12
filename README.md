# tec-ROM-EM-BG
TEC-1 ROM Emulator by Ben Grimmett

https://bennvenn.myshopify.com/pages/eprom-emulator

https://www.facebook.com/pg/TEC-1-Z80-Computer-2109802352631344/photos/?tab=album&album_id=2328021387476105

https://www.facebook.com/groups/AusVintage/search/?query=Eprom%20Emulator&epa=SEARCH_BOX

## Copied from BG web site


A page centred around the Talking Electronics Computer, an Australian designed Z80 based learning computer from the 80's.

My Eprom Emulator:



The files are here:

Inside you will find the *Unsigned* driver which needs to be installed. If you're on win10 you're in for a frustrating 10minutes! A snappy google will show you how to do it. Note: The procedure changes with most major updates so look for a recent guide. This will probably have to be done after every major update as windows will kick out any unsigned drivers.

Included in the RAR archive are:

Z80Upload - This is the tool to send a .bin file to the Emulator. Eg. Z80Upload Foo.bin This will automatically hold your Z80 in a reset state, upload the file then release for the TEC to boot the new binary file. There's no offsets implemented so the file will write to the RAM on the emulator from $0000. 

Speech.ASM - A bit of assembly to make the TEC Speech module talk.

Make.Bat - a small batch file to Assemble Speech.ASM then send it to the Z80.

TASM - Google this, its not mine but is what I like to use.

The other files: Python back end for the Z80Upload program, some TASM files.

I recommend Geany as an IDE. Great formatting for assembly, and you an integrate TASM and Z80Upload into it easily.

Hope this gets you started!

 

TEC Firmware!

I've made a little change to fix the keypad layout. Feels more intuitive. Monitor 2 ROM is here:



The changes to the code are:

Redirecting the NMI address (0066h) to 'KeyRemap' (06E0h - Empty area at the end of the ROM). It is important to pad the ROM with data to keep all the addresses in their correct location.





The code is just a lookup table to convert the Key data to a new value. Feel free to change the data at offset 0700h to whatever key organisation you like!

Snake! - 8x8 led matrix and ~4mhz xtal required.

 

My TEC Video Card:





A work in progress. The latest FPGA configuration file is HERE

The address and port breakdown is as follows:

Base Address of Expansion socket = 0x1000

Mode Register = Port3
Scroll Register = Port4

When in Mode0: - Video RAM Access
Scroll Register = xPssssss
x=dont care
P=Page
s=Scroll Offset
32x32 Character visible screen area located at 0x1000-0x13FF
32x32 Character off screen area located at 0x1400-17FF
1 Page = 32x64 Characters.

When in Mode1: - Character RAM Access
2kbytes Character RAM are mapped to 0x1000-0x17FF
Charaters are drawn as:
0bxxxxxxxx ;Byte 0
0bxxxxxxxx ;Byte 1
0bxxxxxxxx ;Byte 2
0bxxxxxxxx ;Byte 3
0bxxxxxxxx ;Byte 4
0bxxxxxxxx ;Byte 5
0bxxxxxxxx ;Byte 6
0bxxxxxxxx ;Byte 7

When in Mode2: - Spirte Attribute Access
5 Sprites available
0x1000 - Sprite1 X location
0x1001 - Sprite1 Y location
0x1002 - Sprite2 X location
0x1003 - Sprite2 Y location
Down to.....
0x1010 - Sprite9 X location
0x1011 - Sprite9 Y location
0x1012 - Sprite10 X location
0x1013 - Sprite10 Y location

0x1014 - Sprite1 Tile Pointer
0x1015 - Sprite2 Tile Pointer
Down to.....
0x101D - Sprite10 Tile Pointer

When in Mode3: - Sprite RAM Access
0x1000 - 0x1007 Sprite1 Character Data (Tiles)
Down to.....
0x13F0 - 0x13FF Sprite 128 Character Data

Each sprite can use any one of 128 sprite tiles. This is handy for turning them off (selecting a blank tile) or animation (changing the tile without re-writing new tile data) as well as multiplexing tiles to draw more than 10 sprites on screen at once.

Sprites not valid in location 0,0

When power is first applied, ChrRAM is pre-loaded with the default DOS ASCII character set and Vram loaded with a messages on page 0. 

Peripherals : Port5=Peripheral Select, Port6=Data

Interrupt Generator

SD Port:

Peripheral address 0 - Write
B0=SPI speed (0=100khz,1=12.5mhz).
B1=SD_CS (1=selected).
B2=50hz Int Enable (1=Enable)
Read -
B0 = SPI Busy (1=ready for new xfer)
B1 = Card Inserted (1=Card inserted)
Peripheral address 1
SPI Data In or Out. Auto Xfer on writing to Peripheral Port2
Serial Port:

PS2 Port:

 

Speech Board:



 
