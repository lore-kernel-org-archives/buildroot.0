From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 02 Dec 2012 17:13:26 -0800
Subject: [Buildroot] Buildroot 2012.11 released
Message-ID: <87vcck545l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2012.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2012.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2012.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Large number of new packages (43): at91bootstrap3, ccid & pscs-lite,
   gnupg, opus, linux-pam, perl, python3, qemu, tirpc & rpcbind, ..

 - Binutils 2.23.1, GCC 4.7.2. We're now defaulting to GCC 4.6. Newer
   Codebench and Linaro external toolchains. Libtirpc support for modern
   Glibc variants. Toolchain on target has been deprecated.

 - Initial Aarch64 support. Xtensa support re-added.

 - Defconfig updates for newer kernel / bootloader versions. Defconfig
   for Boundarydevices nitrogen6x and QEMU mips64-malta.

 - Manual has been reworked and extended.

 - Lots of package license annotations.

And the usual package version updates and bug fixes. Thanks to the
http://autobuild.buildroot.net autobuilder setup by Thomas Petazzoni we
have been able to fix a lot of different build issues. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.11

Many thanks to all the people contributing to this release:

git shortlog -s -n 2012.08..
   221  Peter Korsgaard
   148  Gustavo Zacarias
   133  Thomas Petazzoni
    57  Allan W. Nielsen
    48  Samuel Martin
    43  Arnout Vandecappelle (Essensium/Mind)
    30  Simon Dawson
    19  Arnout Vandecappelle
    15  Yegor Yefremov
    14  Francois Perrad
    13  Valentine Barshak
     9  Maxime Ripard
     7  Stephan Hoffmann
     6  Jonathan Liu
     6  Sagaert Johan
     5  Mark Jackson
     5  Will Newton
     4  Chris Zankel
     4  Danomi Manchego
     4  Luca Ceresoli
     4  Markos Chandras
     4  Yann E. MORIN
     3  Alexandre Belloni
     3  Baruch Siach
     3  Charles Manning
     3  Marek Belisko
     3  Richard Braun
     3  Sven Neumann
     3  Waldemar Rymarkiewicz
     2  Alexander Khryukin
     2  Gregory Hermant
     2  J.C. Woltz
     2  Kelvin Cheung
     2  Stefan Froberg
     2  Thiago Correa
     2  Vellemans Noel
     2  Zoltan Gyarmati
     1  Alexander Varnin
     1  Beno?t Th?baudeau
     1  Davide Viti
     1  Dimitry Golubovsky
     1  Dmitry
     1  Fabio Porcedda
     1  Ismael Luceno
     1  James Hogan
     1  Jean-Christophe PLAGNIOL-VILLARD
     1  Jean-Mickael Guerin
     1  Jeremy Rosen
     1  Ludovic Desroches
     1  Maxime Hadjinlian
     1  Mischa Jonker
     1  Philippe Reynes
     1  Stefan Fr?berg
     1  Vivien Didelot
     1  Waldemar Brodkorb
     1  Xinglong Liao
     1  gregory hermant

It has been quite a busy development cycle, with more than 850 commits,
lots of new packages and a number of large scale changes. We had a very
nice developer days connected to ELCE in Barcelona. See here for the
report:

http://lists.busybox.net/pipermail/buildroot/2012-November/061558.html

Next release will be 2013.02. Expect the first release candidate early
February, after the developers days which will take place right after
FOSDEM - And the final release towards the end of the month.

-- 
Bye, Peter Korsgaard
