From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 10 May 2012 19:25:44 +0200
Subject: [Buildroot] Buildroot 2012.05-rc1 released
Message-ID: <877gwkc5if.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2012.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2012.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2012.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2012.02..
   158  Gustavo Zacarias
   129  Peter Korsgaard
    72  Thomas Petazzoni
    25  Yegor Yefremov
    12  Maxime Ripard
     9  Arnout Vandecappelle (Essensium/Mind)
     8  Ludovic Desroches
     8  Simon Dawson
     7  Sven Neumann
     6  Markos Chandras
     5  Samuel MARTIN
     4  Alvaro G. M
     4  Luca Ceresoli
     3  Alexandre Belloni
     3  Arnout Vandecappelle
     3  Nicolas Dechesne
     3  Rico Bachmann
     3  Stephan Hoffmann
     2  Frank Hunleth
     2  Marek Belisko
     2  Maxime Hadjinlian
     2  Qais Yousef
     2  Sagaert Johan
     2  Thomas De Schampheleire
     2  Will Newton
     2  Yann E. MORIN
     1  Alexandre Pereira da Silva
     1  Baruch Siach
     1  Dimitry Golubovsky
     1  Fabio Porcedda
     1  Francois Perrad
     1  Ismael Luceno
     1  Jean-Christophe PLAGNIOL-VILLARD
     1  Julian Lunz
     1  Julien Boibessot
     1  Kevin Cernekee
     1  Markus Kaindl
     1  Mathieu Briand
     1  Phil Edworthy
     1  Stephan Thamm
     1  Vanya Sergeev
     1  vsergeev

It's nice to see contributions from lots of new people in addition to
the "oldtimers". This time around Gustavoz took the lead with many many
package updates / fixes.

It has been a pretty busy development cycle, with almost 500 commits,
and a number of large scale changes.

Of noteworthy new features we have:

 - Large number of new packages (34): Systemd, polarssl and a number of
   networking packages.

 - GCC 4.7, uClibc 0.9.33.1 and support for Linaro external ARM
   toolchains.

 - Microblaze support (using external toolchain). Xtensa support is
   deprecated.

 - Additional QEMU defconfigs, including Microblaze and e500 PowerPC.
   Defconfigs for Beaglebone, Pandaboard, Freescale mx53qsb.

 - Patch series support in apply-patches.sh

And the usual package version updates and bug fixes. Thanks to the
autobuilder setup by Thomas Petazzoni we have been able to fix a lot of
different build issues. See the CHANGES file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05_rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2012.05 is released.

Enjoy!

-- 
Bye, Peter Korsgaard
