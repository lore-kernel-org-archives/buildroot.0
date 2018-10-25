From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Oct 2018 18:00:51 +0200
Subject: [Buildroot] Buildroot 2018.08.2 released
Message-ID: <877ei66moc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.08.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.08.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.08.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.08.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.08.1 release.

- Workaround added for incompatibility issues between host-dtc and older
  U-Boot and Linux kernel versions.

- Detect and reject build paths containing '@', as this confuses a
  number of packages, including GCC.

- u-boot: Fix for environment image handling on big endian systems.

- Security fixes for git, libarchive libssh, live555, mongoose, netsnmp,
  ntp, qemu, spice, tinc, wireshark

- Fixes for download/compilation/runtime issues in cups-filters, dtc,
  erlang, file, freetype, gvfs, leveldb, nmap, nodejs, open-plc-utils,
  poco, ptpd2, setools, ustr,

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.08.1..

    10  Peter Korsgaard
     9  Baruch Siach
     9  Thomas Petazzoni
     7  Bernd Kuhls
     6  Fabrice Fontaine
     3  Giulio Benetti
     3  Martin Bark
     3  Matt Weber
     3  Yann E. MORIN
     2  Artyom Panfilov
     2  Yegor Yefremov
     1  Adam Duskett
     1  Francois Gerin
     1  Frank Hunleth
     1  Gr?goire Delattre
     1  Joshua Henderson
     1  Lothar Felten
     1  Marcel Patzlaff
     1  Olivier Schonken
     1  Romain Naour

-- 
Bye, Peter Korsgaard
