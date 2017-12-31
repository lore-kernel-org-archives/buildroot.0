From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 10:35:38 +0100
Subject: [Buildroot] Buildroot 2017.11.1 released
Message-ID: <87zi5zgryt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.11.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.11.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.11.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2017.11 release.

- Security fixes for dhcp, glibc, heimdal, libopenssl, mariadb, nodejs,
  qemu, rsync, tor, vlc, webkitgtk, wireshark,

- Fixes for download/compilation/runtime issues in asterisk,
  checkpolicy, flann, gdb, kodi-pvr-stalker,
  kodi-pvr-mediaportal-tvserver, libcue, libpqxx, libsoxr, linknx,
  linux-tools, lldpd, ltp-testsuite, mfgtools, nut, pulseaudio,
  python-cffi, uboot, uboot-tools, weston, wireguard, xenomai, xfsprogs

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.11..

    11  Bernd Kuhls
     9  Baruch Siach
     6  Fabio Estevam
     5  Peter Korsgaard
     4  Yann E. MORIN
     3  Romain Naour
     2  Adrian Perez de Castro
     2  Angelo Compagnucci
     2  Yegor Yefremov
     1  Damien Riegel
     1  Johan Oudinet
     1  Julien BOIBESSOT
     1  Martin Bark
     1  Norbert Lange
     1  Peter Seiderer
     1  Petr Vorel
     1  Ryan Coe

-- 
Bye, Peter Korsgaard
