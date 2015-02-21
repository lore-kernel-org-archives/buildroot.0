From: William Welch <bvwelch@gmail.com>
Date: Sat, 21 Feb 2015 13:23:09 -0600
Subject: [Buildroot] trouble configuring for beaglebone black and external
 Linaro toolchain, 2015.02-rc2
Message-ID: <CAPALihNuWHDrxf=RcinmAGcx-zchGh=--L209e__O7e+BRpT2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

Thank you for all the great work you are doing in buildroot.

I first built a system using the beaglebone_defconfig, and the make went
fine.  But when I try to select the external linaro toolchain, the make
fails-- EABIhf selected, but toolchain is incompatible...

Steps to repeat:

make beaglebone_defconfig
make menuconfig
   choose external, and it will automatically choose Linraro ARM 2014.09
make
It will download the toolchain
-- gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
but then fail while configuring the toolchain.

What am I missing here?

thank you,

William
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150221/3c8ba0fb/attachment.html>
