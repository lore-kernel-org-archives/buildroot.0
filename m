From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Mon, 31 Aug 2015 20:07:50 +0530
Subject: [Buildroot] First rootfile system build using buildroot
Message-ID: <CAKpDV8uVJjtssJDEx4knqtATvjXzy+kdKtwBoWWLcv-9v4cikg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ,

I am new to buildroot. I am Trying to learn it. I am following this manual.
http://buildroot.uclibc.org/downloads/manual/manual.html

So i have started with Rpi.

I am trying to build my own rootfile system for RPI using buildroot.

I have downloaded following cross compiler folder from git :--
https://github.com/raspberrypi/tools/tree/master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian
as mentioned in this link :--
http://hertaville.com/2012/09/28/development-environment-raspberry-pi-cross-compiler/

My installer GCC compiler is :--
arm-linux-gnueabihf-gcc

crosscompiler is downloaded from git at following location:--
~/home/gcc-linaro-arm-linux-gnueabihf-raspbian

Please suggest what value to fill here for external toolchain selection,
some values i have filled :--

Toolchain type : External toolchain
Toolchain : Custom toolchain
Toolchain origin : Pre-installed toolchain
Toolchain path : ?
Toolchain prefix : ? external
Toolchain kernel header series : ?
external toolchain c library : ?

How i will come to know what is the kernel header is used by above cross
compiler ?

Please suggest.

// katoch
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150831/d064c6e7/attachment.html>
