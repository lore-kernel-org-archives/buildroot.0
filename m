From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Nov 2013 14:21:38 +0100
Subject: [Buildroot] Buildroot 2013.11 released
Message-ID: <87haauuisd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2013.11 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.11.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.11.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

- Large number of new packages (41): Mostly networking related: aiccu,
   autossh, igmpproxy, iputils, knock, libssh2, p910nd, snmppp and
   tcping, Python libraries: python-crc16, python-ipy, python-pyzmq and
   the new components of Qt 5.1: qt5sensors, qt5serialport, qt5x11extras

 - Infrastructure: Make 3.82 ordering fixes, locales generation fixes,
   CVS download support, post-rsync hooks, improvements to legal-info

 - GCC 4.8.2. Glibc support for the internal toolchain, a number of
   upstream uClibc fixes has been backported. Support for external
   toolchains using musl. Updated Linaro external toolchains. Fortran
   and objective-C support deprecated, mudflap support

 - Nios-II architecture support, a number of fixes to MIPS architecture
   handling.

 - New defconfigs: cubieboard2, freescale i.MX 6sololite evk, sabre-sd,
   wandboard added, rpi renamed to raspberrypi_defconfig

And the usual package version updates and bug fixes. Again, the
autobuilder setup has been instrumental to fixing a lot of different
build issues. See the CHANGES file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11

This time we had more than 75 unique contributors! I'm very happy to see
so many "new" people next to the "oldtimers". It was again a very busy
cycle with more than 900 commits and changes all over the tree.

Many thanks to all the people contributing to this release:

git shortlog -s -n 2013.08..

   207  Gustavo Zacarias
   131  Peter Korsgaard
    92  Thomas Petazzoni
    64  Axel Lin
    64  Thomas De Schampheleire
    36  Yann E. MORIN
    34  Jerzy Grzegorek
    25  Arnout Vandecappelle
    25  Simon Dawson
    18  Fatih A??c?
    13  Phil Eichinger
    13  Romain Naour
    12  Ryan Barnett
    10  Francois Perrad
    10  Markos Chandras
    10  Vicente Olivert Riera
     9  Samuel Martin
     8  Matt Weber
     7  J?r?me Pouiller
     6  Michael Rommel
     6  Yegor Yefremov
     5  Arnaud Aujon
     5  Assaf Inbal
     5  Danomi Manchego
     5  Fabio Porcedda
     5  Mischa Jonker
     4  Clayton Shotwell
     4  Ezequiel Garc?a
     3  Andrew Ruder
     3  Arnaud R?billout
     3  Chris Zankel
     3  Eric Nelson
     3  Frank Hunleth
     3  Peter Sanford
     3  Sagaert Johan
     3  gilles.talis at gmail.com
     2  Alexander Lukichev
     2  Baruch Siach
     2  Davide Viti
     2  Luca Ceresoli
     2  Maxime Hadjinlian
     2  Olivier Schonken
     2  Peter Seiderer
     2  Ralph Siemsen
     2  Sergey Alyoshin
     2  Sonic Zhang
     2  Sven Neumann
     2  Thierry Bultel
     2  mathieu benoit
     1  Abdul Hussain
     1  Carlos Quijano
     1  Carsten Schoenert
     1  Dave Skok
     1  Denis Mingulov
     1  Hans Bulfone
     1  Ivan Sergeev
     1  Javier Viguera
     1  Jouko Nikula
     1  Kelvin Cheung
     1  Laurent GONZALEZ
     1  Martin Creutziger
     1  Martin Hicks
     1  Paul B. Henson
     1  Pierre Floury
     1  Reuben Dowle
     1  Rico Bachmann
     1  Spenser Gilliland
     1  Stephan Hoffmann
     1  Thomas Davis
     1  Tristan Lelong
     1  Tzu-Jung Lee
     1  Vivien Didelot
     1  eric.le.bihan.dev at free.fr
     1  nmenegale
     1  tbultel

Next release will be 2014.02, marking the 5 year anniversary of me as
maintainer. Expect the first release candidate around FOSDEM, and the
final release at the end of the month.

We had a very nice developer days meeting after the Embedded Linux
Conference Europe in Edinburgh, UK. Thanks to all the attendees, and
especially Arnout Vandecappelle for writing a detailed report about the
session and to Imagination Technologies for sponsoring:

http://lists.busybox.net/pipermail/buildroot/2013-November/082401.html

The slides of my 'Buildroot: What is new' presentation at ELCE are now
also available:

http://elinux.org/images/2/23/Buildroot-whats-new-elce2013.pdf

The next Buildroot Developer Days meeting will take place on Monday 3rd
and Tuesday 4th February 2014 in Brussels, Belgium - Just after FOSDEM
(February 1st/2nd). Thanks in advance to Google for sponsoring the event
logistics. Developers interested in Buildroot are welcome to join,
please let us know if you are interested in participating. For more
details, see:

http://elinux.org/Buildroot:DeveloperDaysFOSDEM2014

-- 
Bye, Peter Korsgaard
