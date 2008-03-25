From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 11:17:07 +0100
Subject: [Buildroot] Problem with buildroot and AT91SAM9260EK
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA766E@mtsexchange.dc.multitech.prv>
Message-ID: <071201c88e62$ec118710$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I did a dirclean to basically start with a baseline make. When I do a
> "make menuconfig" and select arm architecture, then go to: 
>                    target options--> Atmel Device Support--> Board
> Support for Atmel
> and set the AT91 device to a AT91SAM9260, for the development board
> support selections I get the choice of AT91SAM9260DFC, AT91SAM9260EK, or
> AT91SAM9XE-EK. But in the target/device/atmel directory there is only a
> at91sam9260dfc and at91sam9260pf directory. So if I pick the
> at91sam9260ek I get an error when try to a "make configured" because it
> is looking for files in a nonexistent directory. So my first question is
> whether there is supposed to be an at91sam9260ek directory? Or is the
> at91sam9260dfc the proper one to use even if you are using the board
> mounted DataFlash device?

Only at91sam9260dfc gets regularily tested by me at this point.
Patches for other things is welcome.

If you want to use the internal dataflash, then you can
download binaries for u-boot/dataflashboot from www.linux4sam.org 
Root fs should be the same.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
