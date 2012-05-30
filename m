From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 30 May 2012 23:27:29 +0200
Subject: [Buildroot] Buildroot 2012.05 released
Message-ID: <878vg9xsu6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete Embedded Linux systems
(http://buildroot.net).

Buildroot 2012.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2012.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2012.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

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
http://autobuild.buildroot.net autobuilder setup by Thomas Petazzoni we
have been able to fix a lot of different build issues. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.05

Many thanks to all the people contributing to this release:

git shortlog -s -n 2012.02..

   171  Gustavo Zacarias
   152  Peter Korsgaard
    77  Thomas Petazzoni
    25  Yegor Yefremov
    12  Maxime Ripard
     9  Arnout Vandecappelle (Essensium/Mind)
     9  Ludovic Desroches
     9  Simon Dawson
     7  Markos Chandras
     7  Sven Neumann
     5  Arnout Vandecappelle
     5  Samuel MARTIN
     4  Alvaro G. M
     4  Luca Ceresoli
     4  Thomas De Schampheleire
     3  Alexandre Belloni
     3  Nicolas Dechesne
     3  Rico Bachmann
     3  Stephan Hoffmann
     3  Yann E. MORIN
     2  Frank Hunleth
     2  Marek Belisko
     2  Maxime Hadjinlian
     2  Qais Yousef
     2  Sagaert Johan
     2  Will Newton
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

It has been a quite busy development cycle, with more than 500 commits,
lots of new packages and a number of large scale changes. Part of why we
have been able to handle so many contributions in this cycle is the fact
that we have started to use Patchwork to track patches:

http://patchwork.buildroot.net

Thanks to Jeremy Kerr for his support with this!

Next release will be 2012.08. Expect the first release candidate early
August, and the final release towards the end of the month.

-- 
Bye, Peter Korsgaard
