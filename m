From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Feb 2013 22:57:59 +0100
Subject: [Buildroot] Buildroot 2013.02 released
Message-ID: <87y5e814pk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2013.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.02.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Large number of new packages (66): Jamvm/Classpath reintroduced,
   Development packages (flashbench, perf, ..), QEMU related packages,
   Multimedia (dvdsnoop, gst-fsl-plugins, jpeg-turbo, tvheadend, yavta,
   ..), Raspberry PI support packages, various firmware packages.

 - Infrastructure: Eclipse integration support. Option to set root
   password. Post-image scripts support, similar to post-build.
   Generalized *-config script handling.

 - GDB 7.51, Crosstool-NG 1.17.0, Linaro ARM 2012.11/12 + 2013.01,
   Sourcery CodeBench MIPS 2012.03/09. Infrastructure to warn about
   missing 32bit support for toolchains. Binary toolchain wrapper is now
   relocatable.

 - ARM NEON support toggle. OABI deprecated. Cortex A5/A15 support.

 - Defconfigs: Calao USB-A9260, snowball, QEMU PPC440 on ML507 board,
   QEMU ARM Exynos4210.

And the usual package version updates and bug fixes. Thanks to the
http://autobuild.buildroot.net autobuilder setup by Thomas Petazzoni we
have been able to fix a lot of different build issues. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02

Many thanks to all the people contributing to this release:

git shortlog -s -n 2012.11..

   247  Gustavo Zacarias
   203  Thomas Petazzoni
   127  Peter Korsgaard
    61  Yann E. MORIN
    39  Arnout Vandecappelle (Essensium/Mind)
    20  Samuel Martin
    15  Simon Dawson
    14  Maxime Ripard
    12  Stefan Fr?berg
     8  Gregory Hermant
     8  Stephan Hoffmann
     7  Fabio Porcedda
     7  Francois Perrad
     7  Gilles Talis
     7  Sagaert Johan
     6  Marek Belisko
     5  Maxime Hadjinlian
     4  Carsten Schoenert
     4  Chris Zankel
     3  Beno?t Th?baudeau
     3  Danomi Manchego
     3  Luca Ceresoli
     3  Richard Braun
     3  Sven Neumann
     2  Baruch Siach
     2  Bogdan Radulescu
     2  Jeremy Rosen
     2  Markos Chandras
     2  Mikhail Boiko
     2  Patrick Gerber
     1  ANDY KENNEDY
     1  Alexander Khryukin
     1  Charles Manning
     1  Daniel Nelson
     1  Davide Viti
     1  Floris Bos
     1  Frank Hunleth
     1  Gary Coulbourne
     1  Henrique Camargo
     1  Ignacy Gawedzki
     1  Jan Pedersen
     1  Jean-Christian de Rivaz
     1  Laurent GONZALEZ
     1  Murat Demirten
     1  Ryan Mallon
     1  Tim Sheridan
     1  Tristan Lelong
     1  Victor Hiairrassary
     1  Will Newton
     1  Yegor Yefremov

It has been quite a busy development cycle with almost 850 commits, lots
of new packages and a number of large scale changes. We also had a very
nice developer days connected to FOSDEM in Brussels - See here for the
report:

http://lists.busybox.net/pipermail/buildroot/2013-February/067105.html

Next release will be 2013.05. Expect the first release candidate early
May - And the final release towards the end of the month.

-- 
Bye, Peter Korsgaard
