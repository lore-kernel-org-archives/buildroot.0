From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Feb 2013 13:46:43 +0100
Subject: [Buildroot] Buildroot 2013.02-rc1 released
Message-ID: <87sj54e3po.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2013.02-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.02-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.02-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2012.11..

   228  Gustavo Zacarias
   200  Thomas Petazzoni
   106  Peter Korsgaard
    59  Yann E. MORIN
    37  Arnout Vandecappelle (Essensium/Mind)
    14  Simon Dawson
    13  Maxime Ripard
    13  Samuel Martin
    12  Stefan Fr?berg
     8  Gregory Hermant
     7  Fabio Porcedda
     7  Francois Perrad
     7  Stephan Hoffmann
     6  Marek Belisko
     6  Sagaert Johan
     5  Maxime Hadjinlian
     4  Carsten Schoenert
     4  Chris Zankel
     4  gilles.talis at gmail.com
     3  Beno?t Th?baudeau
     3  Danomi Manchego
     3  Richard Braun
     3  Sven Neumann
     2  Baruch Siach
     2  Bogdan Radulescu
     2  Jeremy Rosen
     2  Luca Ceresoli
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
     1  Gilles Talis
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

Once again, a healthy mix of new people and "oldtimers". It has been a
busy cycle with almost 800 commits (even more than 2012.11!) and a
number of large scale changes.

Of noteworthy new features we have:

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

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.02_rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2013.02 is released.

-- 
Bye, Peter Korsgaard
