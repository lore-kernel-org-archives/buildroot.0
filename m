From: Richard Hardy <richardh@oakleafconsultancy.com>
Date: Fri, 30 May 2008 09:14:59 +0100
Subject: [Buildroot] Linux on at91sam9263ek
Message-ID: <223E6519BDCAC74695BEE9D163F8E6592218BF@oakleaf10.oakleafconsultancy.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I wonder if someone out there has run a linux kernel built with
buildroot on an at91sam9263ek development board?

 

I have managed to build uboot, the kernel and a jffs2 root fs for this
board, but I cannot get the kernel to find the root fs in the board's
NAND flash.

 

We know that the root fs works, as I can mount it from another kernel
which we have, but which we do not have the source code for. So, I guess
that the problem is something related to the options for building either
uboot or the kernel. 

 

The last part of the kernel's boot log is as follows:

 

AT91 MMC: 4 wire bus mode not supported by this driver - using 1 wire

usbcore: registered new interface driver usbhid

drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver

Advanced Linux Sound Architecture Driver Version 1.0.14 (Thu May 31
09:03:25 2007 UTC).

ASoC version 0.13.1

ALSA device list:

  No soundcards found.

TCP cubic registered

NET: Registered protocol family 1

NET: Registered protocol family 17

drivers/rtc/hctosys.c: unable to open rtc device (rtc0)

List of all partitions:

No filesystem could mount root, tried:  jffs2

Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)

RomBOOT

 

Any help would be greatly appreciated.

 

Thanks,

Richard.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080530/e9b53a6a/attachment.htm 
