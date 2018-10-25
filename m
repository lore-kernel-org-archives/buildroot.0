From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Oct 2018 20:58:57 +0200
Subject: [Buildroot] Buildroot 2018.02.7 released
Message-ID: <8736st7szy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.7 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.7.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.7.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.7 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.6 release.

- Detect and reject build paths containing '@', as this confuses a
  number of packages, including GCC.

- u-boot: Fix for environment image handling on big endian systems.

- Security fixes for git, libarchive libssh, live555, mongoose, netsnmp,
  ntp, qemu, spice, tinc, wireshark

- Fixes for download/compilation/runtime issues in ca-certificates,
  cups-filters, erlang, file, freetype, gcc, gvfs, leveldb, libcurl,
  mariadb, nmap, nodejs, open-plc-utils, poco, psmisc, ptpd2, qt,
  qt5base, setools, ustr

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.7

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.6..

    10  Baruch Siach
    10  Peter Korsgaard
    10  Thomas Petazzoni
     8  Bernd Kuhls
     6  Fabrice Fontaine
     4  Adam Duskett
     3  Giulio Benetti
     3  Martin Bark
     3  Yann E. MORIN
     2  Artyom Panfilov
     2  Matt Weber
     2  Yegor Yefremov
     1  Francois Gerin
     1  Frank Hunleth
     1  Gr?goire Delattre
     1  Joshua Henderson
     1  Marcel Patzlaff
     1  Olivier Schonken
     1  Ricardo Martincoski
     1  Romain Naour

--
Bye, Peter Korsgaard
