From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 31 Aug 2011 13:55:13 +0200
Subject: [Buildroot] Buildroot 2011.08 released
Message-ID: <87zkipn6ce.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2011.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - uClibc 0.9.32 / NPTL support, external toolchain and crosstool-ng
   updates, external toolchain wrapper and non-MMU improvements.

 - GENTARGETS/AUTOTARGETS support extended to cover bootloaders and
   Linux kernel as well. Options to retrive Linux/U-Boot from a custom
   git repo instead of upstream tarballs.  Support for Linux 3.x and
   release candidate tarballs. X-Loader bootloader for omap added.

 - Make source/external-deps now also works for external
   toolchains / crosstool-ng backend.

 - Rootfs device handling improvements: Devtmpfs (and mdev/udev)
   support for initramfs configurations

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08

Many thanks to the people contributing to this release:

git shortlog -s -n 2011.05..
   143  Peter Korsgaard
    36  Thomas Petazzoni
    21  Sven Neumann
    13  Gustavo Zacarias
    13  Yegor Yefremov
     9  Maxime Ripard
     7  Yann E. MORIN
     4  Baruch Siach
     4  Daniel Mack
     4  Luca Ceresoli
     3  Jean-Christophe PLAGNIOL-VILLARD
     3  Thomas De Schampheleire
     2  Allan W. Nielsen
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Beno?t Mauduit
     2  Mike Williams
     2  Phil Edworthy
     2  Will Newton
     1  Daniel Hobi
     1  Daniel Nystr?m
     1  Danomi Mocelopolis
     1  Evgeni Dobrev
     1  Francis Mendes
     1  Frederic Bassaler
     1  Frederik Pasch
     1  H Hartley Sweeten
     1  Heiko Helmle
     1  Marek Belisko
     1  Michael J. Hammel
     1  Milton Soares Filho
     1  Philippe Reynes
     1  Robin Holt
     1  Tristan Lelong

Notice that we're having a Buildroot / crosstool-NG developer day,
right after the Embedded Linux Conference Europe (October 29th,
Prague) - Feel free to attend to discuss Buildroot development.

http://lists.busybox.net/pipermail/buildroot/2011-August/045066.html

Thanks to everyone contributing and testing the release candidates -
Enjoy!

-- 
Bye, Peter Korsgaard
