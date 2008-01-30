From: Manuel Sahm <Manuel.Sahm@feig.de>
Date: Wed, 30 Jan 2008 10:32:32 +0100
Subject: [Buildroot] U-Boot Enviroment in NAND Flash ?
Message-ID: <47A04430.1040900@feig.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(It?s about the AT91SAM9260EK)

I want to locate the U-Boot and the U-Boot enviroment in NAND-Flash.

AT91Bootstrap at 0x00000000
U-Boot at 0x00020000
U-Boot Env at 0x00060000
U-BootEnv_Redund at 0x00080000

U-Boot Env Size is 0x 00020000

When U-Boot starts:
.
.(NAND and DATAFLASH is initialized)
.
***Warning - bad CRC or NAND, using default enviroment

How could I "activate" the enviroment variables located in NAND flash at 
address 0x00060000 ?

please help

thanks very very much

Best regards 

Manuel Sahm	
