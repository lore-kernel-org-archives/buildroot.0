From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 22:38:22 +0200
Subject: [Buildroot] Buildroot 2011.08-rc1 released
Message-ID: <87mxfonc8x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2011.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2011.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2011.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2011.05..
   119  Peter Korsgaard
    36  Thomas Petazzoni
    16  Sven Neumann
    12  Gustavo Zacarias
    11  Yegor Yefremov
     6  Maxime Ripard
     4  Baruch Siach
     4  Daniel Mack
     4  Luca Ceresoli
     3  Yann E. MORIN
     2  Allan W. Nielsen
     2  Mike Williams
     2  Phil Edworthy
     2  Thomas De Schampheleire
     2  Will Newton
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Beno?t Mauduit
     1  Daniel Hobi
     1  Daniel Nystr?m
     1  Danomi Mocelopolis
     1  Evgeni Dobrev
     1  Francis Mendes
     1  Frederic Bassaler
     1  Frederik Pasch
     1  H Hartley Sweeten
     1  Marek Belisko
     1  Michael J. Hammel
     1  Milton Soares Filho
     1  Philippe Reynes
     1  Robin Holt
     1  Tristan Lelong

It's nice to see contributions from lots of new people in addition to
the "oldtimers".

Of noteworthy new features we have:

 - Support for uClibc 0.9.32 / NPTL support

 - U-Boot / Linux kernel can now be retrieved from a custom GIT repo,
   rather than from tarballs.

 - Rootfs device handling improvements: Improved device table handling,
   initramfs / devtmpfs fixes.

 - Toolchain: More preconfigured codesourcery external toolchains,
   improved Crosstool-NG support, GCC 4.6.1 / 4.3.6. make
   source/external-deps now also works for non-buildroot toolchains.

 - A number of internal cleanups. GENTARGETS infrastructure is now also
   used for bootloaders and kernel.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2011.08_rc1

Enjoy!

-- 
Bye, Peter Korsgaard
