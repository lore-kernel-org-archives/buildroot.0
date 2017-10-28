From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 21:19:08 +0200
Subject: [Buildroot] Buildroot 2017.02.7 released
Message-ID: <87efpnjd1v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.7 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.7.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.7.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.7 is the 7th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.6 release.

- Security fixes for dnsmasq, git, hostapd, irssi, iucode-tool, lame,
  libcurl, libnss, musl, nodejs, openssh, openvpn, qemu, sdl2,
  webkitgtk, wget, wpa_supplicant, xen, xlib_libXfont, xlib_libXfont2,
  xserver_xorg-server

- Fixes for download/compilation/runtime issues in busybox, bzip2, go,
  libffi, qt, redis

- Linaro toolchains updated to 2017.08 release, fixing a number of
  issues.

- Webkitgtk bumped to the 2.18.x series, fixing a large number of
  security issues.

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.7

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.6..

    26  Peter Korsgaard
    11  Bernd Kuhls
     8  Romain Naour
     5  Baruch Siach
     3  Adrian Perez de Castro
     2  Alexander Mukhin
     2  Alfredo Alvarez Fernandez
     2  Fabio Estevam
     2  Thomas Petazzoni
     1  Andrey Yurovsky
     1  Angelo Compagnucci
     1  Cam Hutchison
     1  Evgeniy Didin
     1  Lothar Felten
     1  Luca Ceresoli
     1  Mauro Condarelli
     1  Olivier Schonken
     1  Thomas De Schampheleire
     1  Vicente Olivert Riera

-- 
Bye, Peter Korsgaard
