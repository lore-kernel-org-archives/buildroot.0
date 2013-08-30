From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 31 Aug 2013 00:40:29 +0200
Subject: [Buildroot] Buildroot 2013.08 released
Message-ID: <87d2oueraa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2013.08 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.08.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.08.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - The work of Spenser Gilliland on improving the ARM multimedia
   support in Buildroot, through a Google Summer of Code, has started
   to flow into Buildroot. To date, Spenser has merged OpenMAX support
   for RasberryPi, the addition of GStreamer 1.x, the bump of the
   glib/gtk/webkit stack to the latest versions, OpenGL support for TI
   OMAP platforms and for Allwinner SOCs.

 - The internal toolchain backend has also seen a number of
   improvements: it has been completely converted to use the common
   package infrastructure, it now supports generating eglibc
   toolchains, and it has a much better support of floating point
   options (EABIhf support, EABI soft-float and softfp, etc.) and
   Thumb/Thumb2 on ARM.

 - The OABI ARM support has been removed, after having been deprecated
   for a while. It is worth mentionning that OABI support has already
   been completely removed from upstream GCC.

 - Defconfigs: beaglebone_defconfig updated, new defconfig for
   CubieBoard, for Olimex mx233 Olinuxino, for Calao Systems
   TNY-A9G20-LPW.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08

Many thanks to all the people contributing to this release:

git shortlog -s -n 2013.05..

   192  Gustavo Zacarias
   126  Thomas Petazzoni
    74  Peter Korsgaard
    49  Spenser Gilliland
    47  Yann E. MORIN
    24  Markos Chandras
    22  gilles.talis at gmail.com
    15  Jerzy Grzegorek
    15  Thomas De Schampheleire
    13  Alexandre Belloni
    12  Simon Dawson
    11  Samuel Martin
    10  Danomi Manchego
     9  Mischa Jonker
     7  Assaf Inbal
     6  Arnout Vandecappelle (Essensium/Mind)
     6  Carsten Schoenert
     6  Richard Genoud
     6  Tzu-Jung Lee
     5  Arnout Vandecappelle
     5  Francois Perrad
     5  Henk Fijnvandraat
     5  Patrick Ziegler
     5  Will Newton
     4  Anders Darander
     4  Fabio Porcedda
     3  Carlo Caione
     3  Jeremy Rosen
     3  J?r?me Pouiller
     3  Philipp Claves
     2  Gregory Hermant
     2  Kelvin Cheung
     2  Maxime Ripard
     2  Sonic Zhang
     2  Wojciech Slenska
     1  A.R.D
     1  ANDY KENNEDY
     1  Alexander Lukichev
     1  Arn R
     1  Baruch Siach
     1  Chris Zankel
     1  Ezequiel Garcia
     1  Fabien Marteau
     1  Frank Hunleth
     1  Gary Coulbourne
     1  Gilles Talis
     1  James Hogan
     1  Jan Viktorin
     1  Jelle Sels
     1  John Stile
     1  Jonathan Liu
     1  Julien Boibessot
     1  Justin Maggard
     1  Luca Ceresoli
     1  Marcin Bis
     1  Marek Belisko
     1  Nathan Ford
     1  Naumann Andreas
     1  Paul B. Henson
     1  Phil Eichinger
     1  Ra?l S?nchez Siles
     1  Reuben Dowle
     1  Ryan Coe
     1  Sagaert Johan
     1  Stephan Hoffmann
     1  Sven Neumann
     1  Tristan Lelong
     1  Valentine Barshak
     1  Vineet Gupta
     1  Vinicius Tinti
     1  Will Wagner
     1  Yegor Yefremov
     1  nmenegale
     1  ?meric Vigier

A special thanks to Thomas Petazzoni for handling the maintainer duties
while I was away!

The Buildroot plugin for Eclipse has also been updated. A new version
3.0 has been released, which is now compatible with the latest version
of Eclipse, Kepler 4.3. See
https://github.com/mbats/eclipse-buildroot-bundle/wiki for more details.

Next release will be 2013.11. Expect the first release candidate early
November, and the final release at the end of the month.

Also worth nothing is that the Buildroot project is organizing a
two-days Buildroot Developers Days meeting on October 26-27 in
Edinburgh, right after the Embedded Linux Conference Europe (October
24-25). Developers interested in Buildroot are welcome to join, please
let us know if you are interested in participating. For more details,
see:

http://www.elinux.org/Buildroot:DeveloperDaysELCE2013

-- 
Bye, Peter Korsgaard
