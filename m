From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 31 May 2013 22:42:01 +0200
Subject: [Buildroot] Buildroot 2013.05 released
Message-ID: <87li6ux4o6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2013.05 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.05.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.05.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

After 3 months of development a new stable Buildroot release is
out. Significant changes are:

 - Large number of new packages (84): Qt5, Wayland, Filesystem
   packages (exfat-utils, f2fs-tools, genimage, genpart, mtools, ..),
   Networking (aircrack-ng, crda, libwebsockets, mongoose, mongrel2,
   nmap, nodejs, openobex, openpgm, ussp-push, wireless-regdb,
   wireshark, ..)  and ZeroMQ packagees (cppzmq, czmq, filemq, zic,
   zyre), Javascript packages various others.

 - Infrastructure: Support for multiple OpenGL / ES / EGL / OpenVG
   providers, similar to how libjpeg / libjpeg-turbo is handled.
   Packages can now add system users.
   Package patch logic reworked as discussed during Febrary dev days:
   http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013

 - GCC 4.6.4 / 4.7.3 / 4.8.0. Default is now 4.7. Crosstool-NG 1.18.0,
   Linaro ARM/Aarch64 2013.02/03, New external Microblaze toolchain.
   Internal Crosstool-NG backend is deprecated.

 - ARC and Blackfin architecture support, FLAT binary format for NOMMU.

 - ARM: Very Old CPU variants have been dropped, Faraday FA526/626 and
   Marvell PJ4 variants added.

 - Defconfigs: Atmel at91sam9g45m10ek, Freescale mpc8315erdb &
   p1010rdb, Armadeus apf27 / apf28, Openblocks A6, Raspberry pi,
   gnublin board

And the usual package version updates and bug fixes. See the CHANGES
file for details:

And the usual package version updates and bug fixes. Thanks to the
recently improved http://autobuild.buildroot.net autobuilder setup by
Thomas Petazzoni we have been able to fix a lot of different build
issues. See the CHANGES file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05

Many thanks to all the people contributing to this release:

git shortlog -s -n 2013.02..

   217	Gustavo Zacarias
   167	Thomas Petazzoni
   109	Will Wagner
    86	Peter Korsgaard
    44	Simon Dawson
    27	Yann E. MORIN
    25	gilles.talis at gmail.com
    15	Samuel Martin
    14	Arnout Vandecappelle (Essensium/Mind)
    14	Luca Ceresoli
    12	Jesper Baekdahl
    12	Mischa Jonker
    11	Carsten Schoenert
    10	Fabio Porcedda
     8	Olivier Schonken
     6	Maxime Ripard
     6	Sonic Zhang
     5	Baruch Siach
     5	Francois Perrad
     5	Jerzy Grzegorek
     4	Andreas Wetzel
     4	Danomi Manchego
     4	Floris Bos
     4	Markos Chandras
     4	Patrick Ziegler
     4	Thomas De Schampheleire
     4	Tilman Keskin?z
     4	Yegor Yefremov
     3	Alexander Lukichev
     3	Arnaud R?billout
     3	Christophe Vu-Brugier
     3	Daniel Price
     3	Gregory Hermant
     3	Jeremy Rosen
     3	Julien Boibessot
     3	Maxime Hadjinlian
     3	Nathan Lynch
     3	Stefan Fr?berg
     3	Will Newton
     2	Justin Maggard
     2	Mark Jackson
     2	Richard Braun
     2	Shawn J. Goff
     2	Stephan Hoffmann
     2	Victor Hiairrassary
     2	Zoltan Gyarmati
     2	nmenegale
     2	przemyslaw
     1	Alexander Khryukin
     1	Alexandre Belloni
     1	Andreas Naumann
     1	Anthony Viallard
     1	Avishay Orpaz
     1	Charles Manning
     1	Daniel Nystr?m
     1	Davide Viti
     1	Dimitrios Siganos
     1	Ezequiel Garcia
     1	Henrique Camargo
     1	Jerin Jacob
     1	Laurent Cans
     1	Lionel Orry
     1	Marek Belisko
     1	Michael J. Hammel
     1	Reuben Dowle
     1	Soren Brinkmann
     1	Sven Neumann
     1	Viallard Anthony
     1	Vinicius Tinti
     1	roylee17

It has been quite a busy development cycle with more than 900 commits,
lots of new packages and a number of large scale changes.

Buildroot has also gotten accepted to this years Google Summer of Code:

https://www.google-melange.com/gsoc/project/google/gsoc2013/spenser/6001

Spenser Gilliland is busy adding multimedia packages, some of which have
been applied to the next branch already.

Next release will be 2013.08. Expect the first release candidate at the
end of July, and the final release at the end of August.

-- 
Bye, Peter Korsgaard
