From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Aug 2013 12:53:10 +0200
Subject: [Buildroot] Buildroot 2013.08-rc1 released!
Message-ID: <20130805125310.4ac553d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2013.08-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.08-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.08-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2013.05..

   173  Gustavo Zacarias
   110  Thomas Petazzoni
    65  Peter Korsgaard
    46  Spenser Gilliland
    45  Yann E. MORIN
    22  gilles.talis at gmail.com
    16  Markos Chandras
    14  Jerzy Grzegorek
    13  Alexandre Belloni
    12  Simon Dawson
     9  Danomi Manchego
     9  Mischa Jonker
     8  Samuel Martin
     8  Thomas De Schampheleire
     7  Assaf Inbal
     6  Arnout Vandecappelle (Essensium/Mind)
     6  Carsten Schoenert
     6  Richard Genoud
     6  Tzu-Jung Lee
     5  Henk Fijnvandraat
     5  Patrick Ziegler
     5  Will Newton
     4  Anders Darander
     4  Fabio Porcedda
     4  Francois Perrad
     3  Carlo Caione
     3  Jeremy Rosen
     3  Philipp Claves
     2  Gregory Hermant
     2  Kelvin Cheung
     2  Maxime Ripard
     2  Sonic Zhang
     2  Wojciech Slenska
     1  ANDY KENNEDY
     1  Arn R
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
     1  J?r?me Pouiller
     1  Marcin Bis
     1  Marek Belisko
     1  Nathan Ford
     1  Naumann Andreas
     1  Paul B. Henson
     1  Phil Eichinger
     1  Ra?l S?nchez Siles
     1  Reuben Dowle
     1  Sagaert Johan
     1  Sven Neumann
     1  Tristan Lelong
     1  Valentine Barshak
     1  Will Wagner
     1  Yegor Yefremov
     1  nmenegale
     1  ?meric Vigier

With 658 patches merged, this -rc1 cycle is a little bit less busy
than the one of the previous release, during which we had merged 768
patches, though there is still a significant activity, from both major
contributors and a significant number of occasional ones.

Of noteworthy new features we have:

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
   been completely removed from upstream gcc.

 - Defconfigs: beaglebone_defconfig updated, new defconfig for
   CubieBoard, for Olimex mx233 Olinuxino, for Calao Systems
   TNY-A9G20-LPW.

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.08_rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2013.08 is released.

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
