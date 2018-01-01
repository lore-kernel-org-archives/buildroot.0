From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Jan 2018 12:37:06 +0100
Subject: [Buildroot] Buildroot 2017.02.9 released
Message-ID: <87shbpajz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.9 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.9.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.9.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.9 is the 9th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.8 release.

- Security fixes for dhcp, exim, heimdal, libcurl, mariadb, nodejs,
  openssl, rsync, tor, vlc, webkitgtk, wireshark, xlib_libXcursor,
  xlib_libXfont, xlib_libXfont2

- Fixes for download/compilation/runtime issues in flann, gdb, libcue,
  libevent, libpqxx, libsoxr, linphone, lldpd, mfgtools, mtools, nut,
  samba4, webkitgtk, xfsprogs

- Fix divide by zero issue in size-stats script.

- Fix makefile include ordering issue with certain make versions in the
  external toolchain handling.

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.9

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.8..

    13  Bernd Kuhls
     6  Baruch Siach
     6  Fabio Estevam
     6  Peter Korsgaard
     3  Adrian Perez de Castro
     3  Romain Naour
     2  Peter Seiderer
     2  Ryan Coe
     1  Andrey Yurovsky
     1  Carlos Santos
     1  Damien Riegel
     1  Danomi Manchego
     1  Fabrice Fontaine
     1  Jerzy Grzegorek
     1  Johan Oudinet
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
