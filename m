From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jul 2017 08:30:24 +0200
Subject: [Buildroot] Buildroot 2017.05.2 released
Message-ID: <87pocmv1bz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.05.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.05.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.05.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.05.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2017.05.1 release.

- Security fixes for apache, bind, expat, heimdal, irssi, libosip2,
  libtirpc, mpg123, pcre, php, samba4, spice, tcpdump, tiff, webkitgtk,
  xserver_xorg-server.

- Fixes for download/compilation/runtime issues in aespipe, binutils,
  busybox, ccache, collectd, dieharder, efibootmgr, efivar, ffmpeg, gcc,
  iproute2, libglib2, libmemcached, libxml-parser-perl, linux-fusion,
  linux-zigbee, orc, pulseaudio, python-setproctitle, qt5base,
  rpi-firmware, syslinux, systemd, uboot-tools, x265, xvisor.

- Webkitgtk bumped to the 2.16.x series, fixing a large number of
  security issues.

- host-aespipe compile fix for Debian/Gentoo/Ubuntu toolchains which
  default to PIE mode.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.05.1..

    12  Bernd Kuhls
    12  Peter Korsgaard
     8  Thomas Petazzoni
     5  Baruch Siach
     4  Adri?n P?rez de Castro
     3  Arnout Vandecappelle
     3  Fabio Estevam
     3  Peter Seiderer
     3  Romain Naour
     3  Yann E. MORIN
     1  Ben Leinweber
     1  Calin Crisan
     1  Carlos Santos
     1  Dmitrii Kolesnichenko
     1  Julien Viard de Galbert
     1  J?rg Krause
     1  Matt Weber
     1  Matthew Shyu
     1  Rodrigo Rebello
     1  Thomas De Schampheleire
     1  Vicente Olivert Riera
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
