From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 08 May 2013 16:00:30 +0200
Subject: [Buildroot] Buildroot 2013.05-rc1 released
Message-ID: <87sj1xy3k1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot 2013.05-rc1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2013.05-rc1.tar.gz

or

http://buildroot.net/downloads/buildroot-2013.05-rc1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -s -n 2013.02..

   193	Gustavo Zacarias
   137	Thomas Petazzoni
   108	Will Wagner
    60	Peter Korsgaard
    40	Simon Dawson
    24	Yann E. MORIN
    13	gilles.talis at gmail.com
    12	Jesper Baekdahl
    12	Samuel Martin
    11	Carsten Schoenert
    11	Luca Ceresoli
    11	Mischa Jonker
     7	Fabio Porcedda
     6	Olivier Schonken
     5	Arnout Vandecappelle (Essensium/Mind)
     5	Francois Perrad
     5	Maxime Ripard
     5	Sonic Zhang
     4	Andreas Wetzel
     4	Baruch Siach
     4	Floris Bos
     4	Jerzy Grzegorek
     4	Thomas De Schampheleire
     4	Tilman Keskin?z
     4	Yegor Yefremov
     3	Alexander Lukichev
     3	Arnaud R?billout
     3	Christophe Vu-Brugier
     3	Daniel Price
     3	Danomi Manchego
     3	Gregory Hermant
     3	Julien Boibessot
     3	Maxime Hadjinlian
     3	Nathan Lynch
     3	Patrick Ziegler
     3	Stefan Fr?berg
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
     1	Jeremy Rosen
     1	Jerin Jacob
     1	Laurent Cans
     1	Lionel Orry
     1	Marek Belisko
     1	Markos Chandras
     1	Michael J. Hammel
     1	Reuben Dowle
     1	Soren Brinkmann
     1	Sven Neumann
     1	Viallard Anthony
     1	Vinicius Tinti
     1	roylee17

Once again, a healthy mix of new people and "oldtimers". Like the
previous cycle, this has again been a busy cycle with almost 800
commits and a number of large scale changes.

Of noteworthy new features we have:

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

http://git.buildroot.net/buildroot/plain/CHANGES?id=2013.05_rc1

Like usual, I will now create a next branch and start merging in new
features, rather than wait until 2013.05 is released.

-- 
Bye, Peter Korsgaard
