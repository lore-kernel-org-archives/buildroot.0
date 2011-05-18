From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 May 2011 23:05:43 +0200
Subject: [Buildroot] Buildroot 2011.05-rc1 released
Message-ID: <8762p7vhw8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2011.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2011.02..
   116  Peter Korsgaard
    66  Gustavo Zacarias
    29  Thomas Petazzoni
     9  Will Newton
     7  Yegor Yefremov
     4  Phil Edworthy
     3  Chih-Min Chao
     3  Mike Frysinger
     3  Mike Williams
     3  Vasily Khoruzhick
     3  Yann E. MORIN
     2  Hector Oron
     2  Heiko Zuerker
     2  Jean-Christophe PLAGNIOL-VILLARD
     2  Kelvin Cheung
     2  Luca Ceresoli
     2  Martin Hicks
     1  Alexander Clouter
     1  Andy Kennedy
     1  Fabien Marteau
     1  Guillaume Gardet
     1  H Hartley Sweeten
     1  Klaus Schwarzkopf
     1  Malte Starostik
     1  Marek Belisko
     1  Sonic Zhang

This has been a relatively calm release cycle. Of noteworthy new
features we have:

 - External toolchain improvements: We now build a binary toolchain
   wrapper and install it into HOST_DIR/usr/bin, which enforces the
   correct compiler arguments, making an external toolchain as easy to
   use outside of Buildroot as the internal ones are. This also
   brought a cleanup of CFLAGS, making the Buildroot build output
   easier to read. With this change, we are one step closer to being
   able to create a real Buildroot SDK.

 - Rootfs device handling improvements: Choice between static /dev,
   devtmpfs and devtmpfs with either mdev or udev.

 - Toolchain: More preconfigured codesourcery external toolchains,
   improved Crosstool-NG support, fix for GCC snapshot versions, GCC
   4.4.6 / 4.5.3, experimental GCC 4.6.0 support, target-GCC fixes,
   uClibc fixes and 0.9.32-rc3 support.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.05_rc1

Enjoy!

-- 
Bye, Peter Korsgaard
