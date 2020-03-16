From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2020 17:20:57 +0100
Subject: [Buildroot] Buildroot 2019.11.2 released
Message-ID: <87y2s0s23a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.11.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.11.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.11.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.11.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.11.1 release.

- Core: Ensure package-file-lists data is correct after incremental
  builds as well.

- Fix a race condition related to creating the output/staging symlink on
  systems with coreutils < 8.27.

- Toolchain: ARC tools bumped to arc-2019.09.

- Br2-external: Fix patch handling when external linux-extension
  packages are used. Fix compatibility with make 4.3+

- Util-linux: Ensure that hwclock is built without GPLv3 code. Notice
  that builds with hwclock has contained GPLv3-licensed code since
  util-linux 2.30 (Buildroot 2017.08+)

- Security fixes for blktrace, bootstrap, cairo, clamav, dnsmasq,
  docker-containerd, dovecot, e2fsprogs, exiv2, go, jhead, libarchive,
  libexif, libgdiplus, libjpeg, libsndfile, libssh2, libvncserver,
  libvorbis, libxml2, libxslt, lz4, mariadb, mbedtls, mongoose, ncurses,
  nodejs, ntfs-3g, openjpeg, openswan, patch, php, pppd, postgresql,
  proftpd, pure-ftpd, python-django, qt5base, rdesktop, runc, samba4,
  shellinabox, sqlcipher, squid, suricata, taglib, vorbis-tools,
  webkitgtk, wireshark, wpewebkit, xen, zsh, zziplib

- Fixes for download/compilation/runtime/license issues in armadillo,
  at, bcm2835, binutils, bluez-alsa, brltty, busybox, cog, cups, czmq,
  elf2flt, eudev, exim, fbgrab, gettext-tiny, glibc, go, grep,
  gst1-validate, guile, imagemagick, jpeg-turbo, kvm-unit-tests, lapack,
  libdrm, libevent, libftdi1, libsigrok, libsvgtiny, linknx, linux, lxc,
  mariadb, meson, mfgtools, mosquitto, musl, ogre, opencv3, openjdk-bin,
  openrc, openvmtools, optee-test, piglit, python-pyqt5,
  python-setuptools-scm-git-archive, python3, qemu, qt5base, qt5tools,
  qt5virtualkeyboard, qt5webengine, qwt, ruby, skeleton-init-openrc,
  smartmontools, spdlog, suricata, swig, swupdate, sysklogd, thrift,
  ti-cgt-pru, uboot, uclibc, util-linux, wpebackend-fdo, xen,
  xserver_xorg-server, zeromq

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.11.1..

    65  Fabrice Fontaine
    40  Peter Korsgaard
    10  Peter Seiderer
     9  Romain Naour
     7  Carlos Santos
     7  Yann E. MORIN
     6  Thomas Petazzoni
     5  Bernd Kuhls
     5  Giulio Benetti
     5  Yegor Yefremov
     4  Ryan Coe
     4  Thomas De Schampheleire
     3  Adrian Perez de Castro
     3  Max Filippov
     2  Adam Duskett
     2  Angelo Compagnucci
     2  Baruch Siach
     2  Christian Stewart
     2  Evgeniy Didin
     2  Heiko Thiery
     2  James Hilliard
     2  Luca Ceresoli
     2  Titouan Christophe
     1  Alexandre PAYEN
     1  Alexey Lukyanchuk
     1  Andreas Naumann
     1  Ash Charles
     1  Bartosz Bilas
     1  Chris Packham
     1  Gary Bisson
     1  Gilles Talis
     1  Joel Stanley
     1  John Keeping
     1  Julien Olivain
     1  J?rg Krause
     1  Mark Corbin
     1  Matt Weber
     1  Michael Fischer
     1  Pascal de Bruijn
     1  Pierre-Jean Texier
     1  Yi Zheng

-- 
Bye, Peter Korsgaard
