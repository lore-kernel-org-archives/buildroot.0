From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Sep 2019 13:11:55 +0200
Subject: [Buildroot] Buildroot 2019.05.2 released
Message-ID: <878sr5ws5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.05.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.05.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.05.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.05.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.05.1 release.

- Filesystems: Pass extra pax options to tar for binary reproducibility.

- Security fixes for apache, asterisk, bzip2, clamav, collectd, dovecot,
  dovecot-pigeonhole, elfutils, exim, giflib, gnupg2, go, imagemagick,
  libbsd, libgit2, libssh2, mpg123, musl, nginx, oniguruma, openjdk,
  openjdk-bin, openldap, php, postgresql, proftpd, python,
  python-django, python-urllib3, python3, qemu, squid, subversion,
  tcpreplay, unzip, vlc, webkitgtk, xen, xlib_libICE, zeromq

- Fixes for download/compilation/runtime issues in arm-trusted-firmware,
  autofs, atk, busybox, cloop, cmake, connman-gtk, dahdi-linux,
  dahdi-tools, daq, dehydrated, dhcp, expect, git, glibc, gnutls,
  gst1-rtsp-server, gtkperf, gupnp-tools, gvfs, imx-uuc, json-glib,
  lftp, libcurl, libdnet, libgtk2, libgtk3, libnss, libpri, libss7,
  libvips, libxcb, mesa3d, metacity, openblas, opencv3, openvmtools,
  pcmanfm, pigpio, prboom, proj, python-idna, python-numpy, qemu,
  qt5base, qt5enginio, quagga, rygel, tcpreplay, vte, xfont_font-util,
  xlib_libXfont, xlib_libXfont2, yad

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.05.1..

    48  Fabrice Fontaine
    29  Bernd Kuhls
    21  Peter Korsgaard
    11  Thomas Petazzoni
     9  Giulio Benetti
     6  Arnout Vandecappelle (Essensium/Mind)
     4  Adam Duskett
     4  Carlos Santos
     3  Atharva Lele
     3  Baruch Siach
     3  Pierre-Jean Texier
     3  Yann E. MORIN
     2  Alex Xu
     2  Alexandre PAYEN
     2  J?rg Krause
     2  Romain Naour
     1  Adrian Perez de Castro
     1  Alexey Brodkin
     1  Angelo Compagnucci
     1  Asaf Kahlon
     1  Brent Generous
     1  Christian Stewart
     1  Damien DUVAL
     1  Frank Vanbever
     1  Nicolas Cavallari
     1  Simon Rowe
     1  S?bastien Szymanski
     1  S?rensen, Stefan
     1  Titouan Christophe
     1  Vincent Stehl?

Notice that only one more update is planned for the 2019.05.x
series. Please consider migrating to our current stable release
(2019.08.x, supported until December) or the long term release
(supported until March 2020).

-- 
Bye, Peter Korsgaard
