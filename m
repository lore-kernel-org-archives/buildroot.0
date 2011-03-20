From: Torsten Mohr <tmohr@s.netic.de>
Date: Sun, 20 Mar 2011 23:25:39 +0100
Subject: [Buildroot] 2011.02, BeagleBoard-xM, linux-2.6.37 does not boot
Message-ID: <201103202325.39993.tmohr@s.netic.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i configured and compiled buildroot-2011.02, which comes with 2.6.37 as the 
default kernel setting.  I chose this one and "omap2plus" as the defconfig 
name.

u-boot.bin boots fine, but the kernel does not show any output.  All i see is:

reading uImage                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                    
2929528 bytes read
Booting from mmc ...
## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-2.6.37
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2929464 Bytes = 2.8 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

There's nothing more after this.  I also tried "omap3" as defconfig (and 
copied that 0map3_defconfig from a previous kernel, same result).

Not sure if i missed something, some questions came up:

- does buildroot use the correct kernel for BeagleBoard-xM?
- do i need to apply patches?
- what configuration file do i need to chose?
- does u-boot need special options to boot that kernel?

It would be great if anybody had some hints for me.


Best regards,
Torsten.
