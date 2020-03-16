From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2020 22:44:43 +0100
Subject: [Buildroot] Buildroot 2019.02.10 released
Message-ID: <87tv2orn3o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.10 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.10.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.10.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.10 is a bugfix release on the previous long term
release, fixing a number of important / security related issues
discovered since the 2019.02.9 release.

Notice that the 2019.02.x series will only see one more update before
going end of life. Please consider migrating to the 2020.02.x series
instead.

- Core: Ensure package-file-lists data is correct after	incremental
  builds as well.

- Fix a race condition related to creating the output/staging symlink on
  systems with coreutils < 8.27.

- Br2-external: Fix compatibility with make 4.3+

- Util-linux: Ensure that hwclock is built without GPLv3 code. Notice
  that builds with hwclock has contained GPLv3-licensed code since
  util-linux 2.30 (Buildroot 2017.08+)

- Security fixes for blktrace, bootstrap, cairo, dnsmasq,
  docker-containerd, dovecot, e2fsprogs, exiv2, jhead, libcgroup,
  libexif, libjpeg, libsndfile, libssh2, libvncserver, libvorbis,
  libxml2, libxslt, lz4, mariadb, mbedtls, mongoose, ncurses, ntfs-3g,
  openjpeg, openswan, patch, php, postgresql, pppd, proftpd, pure-ftpd,
  python-django, qt5base, rdesktop, runc, samba4, shellinabox,
  sqlcipher, squid, taglib, vorbis-tools, webkitgtk, wireshark, xen, zsh

- Fixes for download/compilation/runtime/license issues in armadillo,
  at, binutils, busybox, cups, czmq, eudev, exim, fbgrab, grep,
  gst1-validate, guile, imagemagick, jpeg-turbo, kvm-unit-tests, lapack,
  libftdi1, libsigrok, libsvgtiny, linux, mariadb, meson, mfgtools,
  opencv3, openvmtools, python-pyqt5, python3, qemu, qt5base,
  qt5webengine, qwt, ruby, smartmontools, swupdate, sysklogd, thrift,
  ti-cgt-pru, uboot, util-linux, xserver_xorg-server, zeromq,

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.10

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.9..

    66  Fabrice Fontaine
    34  Peter Korsgaard
     7  Carlos Santos
     5  Bernd Kuhls
     5  Peter Seiderer
     5  Ryan Coe
     4  Giulio Benetti
     4  Thomas De Schampheleire
     4  Thomas Petazzoni
     4  Yann E. MORIN
     3  Nicolas Serafini
     3  Yegor Yefremov
     2  Angelo Compagnucci
     2  Baruch Siach
     2  Luca Ceresoli
     2  Matt Weber
     2  Sam Voss
     1  Adam Duskett
     1  Adrian Perez de Castro
     1  Alexander Mukhin
     1  Alexandre PAYEN
     1  Alexey Lukyanchuk
     1  Andreas Naumann
     1  Ash Charles
     1  Chris Packham
     1  Christian Stewart
     1  Christopher McCrory
     1  Francois Perrad
     1  Gary Bisson
     1  Heiko Thiery
     1  Jan Willem Janssen
     1  Joel Stanley
     1  John Keeping
     1  Julien Olivain
     1  Max Filippov
     1  Michael Fischer
     1  Nicolas Carrier
     1  Pascal de Bruijn
     1  Pierre-Jean Texier
     1  Romain Naour
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
