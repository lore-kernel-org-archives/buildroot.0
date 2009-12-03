From: Jens Kleinhans <Jens.Kleinhans@gmx.de>
Date: Thu, 03 Dec 2009 16:43:14 +0100
Subject: [Buildroot] Problems connecting to AT91SAM9260
Message-ID: <20091203154314.237790@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to connect to the ARM board mentioned in the subject with
minicom.
So I connected the board with the RS232 interface and the USB_D
interface to my host PC and configured minicom with the following
parameters:
115200, 8bits, 1stop, no parity, no flow
Then I powered up the board. It started sending some datas to minicom
about the boot process. Then it ended up with the lines:
Uncompressing Linux...RomBOOT
>RomBOOT

I don't get the chance to communicate with the board. How can I
communicate with minicom?

Can you please give us a hint or tell us what the problem is all about

Following the datas which the minicom receives from the board:

[b]root at littel-laptop:/home/littel/buildroot# minicom


Willkommen zu minicom 2.3-rc1

Optionen: I18n 
?bersetzt am Dec 10 2007, 10:36:19.
Port /dev/ttyUSB0

                 Dr?cken Sie CTRL-A  Z f?r Hilfe zu speziellen
Tasten       
                                                                            
RomBOOT                                                                     
>AT91Bootstrap loading from
0x8400...                                       
                                                                            

U-Boot 1.3.4-00001-g8ed2f5f-dirty (Aug 20 2008 - 18:26:55)

DRAM:  64 MB
NAND:  512 MiB
DataFlash:AT45DB161
Nb pages:   4096
Page Size:    528
Size= 2162688 bytes
Logical address: 0xD0000000
Area 0: D0000000 to D00041FF (RO) Bootstrap
Area 1: D0004200 to D00083FF      Environment
Area 2: D0008400 to D0041FFF (RO) U-Boot
Area 3: D0042000 to D0251FFF      Kernel
Area 4: D0252000 to D020FFFF      FS
In:    serial
Out:   serial
Err:   serial
Net:   macb0
macb0: Starting autonegotiation...
macb0: Autonegotiation timed out (status=0x7849)
macb0: link down (status: 0x7849)
Hit any key to stop autoboot:  0 
## Booting kernel from Legacy Image at 22200000 ...
   Image Name:   Linux-2.6.26.3-olimex
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    1766504 Bytes =  1.7 MB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux...RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT
>RomBOOT...

Best regards

Jens Kleinhans
-- 
Sarah Kreuz, die DSDS-Siegerin der Herzen, mit ihrem eindrucksvollen           
Deb?talbum "One Moment in Time". http://portal.gmx.net/de/go/musik
