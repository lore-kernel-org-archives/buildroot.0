From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 30 Jan 2008 12:03:06 +0100
Subject: [Buildroot] U-Boot Enviroment in NAND Flash ?
References: <47A04430.1040900@feig.de>
Message-ID: <000401c8634b$5474fff0$8901a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,
> 
> (It?s about the AT91SAM9260EK)
> 
> I want to locate the U-Boot and the U-Boot enviroment in NAND-Flash.
> 
> AT91Bootstrap at 0x00000000
> U-Boot at 0x00020000
> U-Boot Env at 0x00060000
> U-BootEnv_Redund at 0x00080000
> 
> U-Boot Env Size is 0x 00020000
> 
> When U-Boot starts:
> .
> .(NAND and DATAFLASH is initialized)
> .
> ***Warning - bad CRC or NAND, using default enviroment
> 
> How could I "activate" the enviroment variables located in NAND flash at 
> address 0x00060000 ?
> 

This will require a new board support option.
Have a look at http://www.linux4sam.org/ for more info on NAND support.

Integrate with buildroot and send a patch.




Best Regards
Ulf Samuelsson
