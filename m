From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 23:45:00 +0200
Subject: [Buildroot] Buildroot 2017.02.5 released
Message-ID: <87tw1yvpnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.5 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.5.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.5.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.5 is the 5th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.4 release.

- Security fixes for apache, bind, expat, heimdal, irssi, libosip2,
  libtirpc, mpg123, nodejs, pcre, php, samba4, spice, tcpdump, tiff,
  webkitgtk, xen, xserver_xorg-server.

- Fixes for download/compilation/runtime issues in aespipe, binutils,
  ccache, collectd, efibootmgr, efivar, ffmpeg, gcc, iproute2, libglib2,
  libmemcached, libxml-parser-perl, linux-fusion, linux-zigbee, orc,
  pulseaudio, python-setproctitle, qt5base, rpi-firmware, syslinux,
  systemd, x265, xvisor.

- Webkitgtk bumped to the 2.16.x series, fixing a large number of
  security issues.

- host-aespipe compile fix for Debian/Gentoo/Ubuntu toolchains which
  default to PIE mode.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.4..

    16  Peter Korsgaard
    11  Bernd Kuhls
     8  Thomas Petazzoni
     5  Baruch Siach
     4  Adri?n P?rez de Castro
     4  Vicente Olivert Riera
     3  Fabio Estevam
     3  Peter Seiderer
     3  Romain Naour
     3  Yann E. MORIN
     2  Arnout Vandecappelle
     1  Ben Leinweber
     1  Calin Crisan
     1  Dmitrii Kolesnichenko
     1  Matt Weber
     1  Matthew Shyu
     1  Rahul Bedarkar
     1  Rodrigo Rebello
     1  Thomas De Schampheleire
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
