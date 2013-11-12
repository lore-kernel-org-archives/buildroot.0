From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 13 Nov 2013 00:21:45 +0100
Subject: [Buildroot] Buildroot 2013.11-rc1 released
Message-ID: <87ppq52ol1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2013.11-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.11-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.11-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2013.08..

   183  Gustavo Zacarias
   111  Peter Korsgaard
    84  Thomas Petazzoni
    64  Axel Lin
    58  Thomas De Schampheleire
    36  Yann E. MORIN
    34  Jerzy Grzegorek
    22  Arnout Vandecappelle (Essensium/Mind)
    18  Simon Dawson
    16  Fatih A??c?
    13  Phil Eichinger
    11  Romain Naour
    11  Ryan Barnett
    10  Francois Perrad
    10  Markos Chandras
     8  Matt Weber
     7  J?r?me Pouiller
     7  Samuel Martin
     6  Michael Rommel
     6  Yegor Yefremov
     5  Assaf Inbal
     5  Danomi Manchego
     5  Mischa Jonker
     4  Clayton Shotwell
     4  Fabio Porcedda
     3  Arnaud Aujon
     3  Eric Nelson
     3  Frank Hunleth
     3  Peter Sanford
     3  Sagaert Johan
     3  gilles.talis at gmail.com
     2  Alexander Lukichev
     2  Arnaud R?billout
     2  Ezequiel Garcia
     2  Luca Ceresoli
     2  Maxime Hadjinlian
     2  Olivier Schonken
     2  Peter Seiderer
     2  Ralph Siemsen
     2  Sergey Alyoshin
     2  Thierry Bultel
     2  mathieu benoit
     1  Abdul Hussain
     1  Andrew Ruder
     1  Carlos Quijano
     1  Carsten Schoenert
     1  Chris Zankel
     1  Dave Skok
     1  Denis Mingulov
     1  Ezequiel Garc?a
     1  Hans Bulfone
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
     1  Sonic Zhang
     1  Spenser Gilliland
     1  Stephan Hoffmann
     1  Thomas Davis
     1  Tristan Lelong
     1  Tzu-Jung Lee
     1  Vivien Didelot
     1  eric.le.bihan.dev at free.fr
     1  nmenegale
     1  tbultel

This time we had more than 70 unique contributors! I'm very happy to see
so many "new" people next to the "oldtimers". It was again a very busy
cycle with more than 800 commits and changes all over the tree.

Of noteworthy new features we have:

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

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.11_rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2013.11 is released.

-- 
Bye, Peter Korsgaard
