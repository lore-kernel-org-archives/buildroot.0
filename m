From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Sep 2019 22:53:32 +0200
Subject: [Buildroot] Buildroot 2019.02.5 released
Message-ID: <877e6qxvw3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.5 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.5.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.5.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.5 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.4 release. The 2019.02.x series is
supported until March 2020.

- Filesystems: Pass extra pax options to tar for binary reproducibility.

- Security fixes for apache, asterisk, bzip2, clamav, collectd, dovecot,
  dovecot-pigeonhole, elfutils, exim, giflib, gnupg2, go, imagemagick,
  libbsd, libgit2, libssh2, mpg123, musl, nginx, openldap, php,
  postgresql, proftpd, python, python-django, python-urllib3, python3,
  qemu, squid, subversion, tcpreplay, unzip, vlc, webkitgtk, xen,
  xlib_libICE, zeromq

- Fixes for download/compilation/runtime issues in arm-trusted-firmware,
  autofs, atk, brotli, busybox, cloop, cmake, connman-gtk, cryptopp,
  dahdi-linux, dahdi-tools, daq, dehydrated, expect, git, glibc, gnutls,
  gst1-rtsp-server, gtkperf, gupnp-tools, gvfs, imx-uuc, json-glib,
  lftp, libcurl, libdnet, libgtk2, libgtk3, libnss, libpri, libss7,
  libvips, libxcb, mesa3d, metacity, openblas, opencv3, openvmtools,
  pcmanfm, pigpio, prboom, proj, python-idna, python-numpy, qemu,
  qt5base, qt5enginio, quagga, rygel, tcpreplay, vte, weston,
  xfont_font-util, xlib_libXfont, xlib_libXfont2, yad

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.5

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.4..

    51  Fabrice Fontaine
    29  Bernd Kuhls
    21  Peter Korsgaard
    11  Giulio Benetti
    11  Thomas Petazzoni
     6  Arnout Vandecappelle (Essensium/Mind)
     5  Adam Duskett
     4  Baruch Siach
     4  Yann E. MORIN
     3  Atharva Lele
     3  Pierre-Jean Texier
     2  Alex Xu
     2  Alexandre PAYEN
     2  J?rg Krause
     2  Romain Naour
     1  Adrian Perez de Castro
     1  Alexey Brodkin
     1  Asaf Kahlon
     1  Brent Generous
     1  Frank Vanbever
     1  Nicolas Cavallari
     1  Peter Seiderer
     1  Simon Rowe
     1  S?bastien Szymanski
     1  S?rensen, Stefan
     1  Titouan Christophe
     1  Vincent Stehl?

-- 
Bye, Peter Korsgaard
