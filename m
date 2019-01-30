From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 17:18:11 +0100
Subject: [Buildroot] Buildroot 2018.11.2 released
Message-ID: <87y372yv98.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.11.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.11.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.11.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.11.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.11.1 release.

- Fixes for imx6slevk, imx7dsabresd, imx8mqevk, Lego EV3 and QEMU
  AArch64-virt defconfigs

- Download: Fix scp download handling

- check-package: fix Python 3 support

- get-developers: Fix behaviour when called from elsewhere than the
  toplevel directory.

- kconfig: Fix for make linux-menuconfig / uboot-menuconfig from a clean
  tree when ccache is enabled.

- cmake: Also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake

- Security fixes for apache, gnupg2, go, libarchive, libsndfile,
  liburiparser, libxml2, mariadb, mbedtls, mosquitto, netatalk, openssh,
  pango, php, python-django, python-pyyaml, samba4, sqlite, subversion,
  systemd, tcprelay, wireshark, wolfssl

- Fixes for download/compilation/runtime issues in acpica, apr, cargo,
  cc-tool, dash, dhcpdump, dmalloc, docker-containerd, efivar, fwts,
  glibc, gnuchess, leveldb, libftdi1, libmad, libsquish, libwebsock,
  lighttpd, llvm, lm-sensors, lxc, meson, nodejs, odhcp6c, openresolv,
  patchelf, python-numpy, rauc, s6-networking, sdl_sound,
  shairport-sync, sunxi-cedarx, swupdate, tekui, tpm2-abrmd, tpm2-tools,
  tpm2-tss, udisks, unixodbc, webkitgtk, xapp_rgb, xenomai

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.11.1..

    33  Peter Korsgaard
    19  Fabrice Fontaine
    12  Thomas Petazzoni
     6  Baruch Siach
     6  Ricardo Martincoski
     5  James Hilliard
     4  Thomas De Schampheleire
     3  Andr? Hentschel
     3  Asaf Kahlon
     3  Matt Weber
     3  Romain Naour
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Bernd Kuhls
     2  Carlos Santos
     2  Fabio Estevam
     2  Francois Perrad
     2  Mark Corbin
     2  Peter Seiderer
     2  Vadim Kochan
     2  Yann E. MORIN
     1  Adam Duskett
     1  Christian Stewart
     1  Clayton Shotwell
     1  David Lechner
     1  Evgeniy Didin
     1  Gerome Burlats
     1  Gr?goire Delattre
     1  Jared Bents
     1  Ryan Coe
     1  Sergio Prado
     1  Trent Piepho

-- 
Bye, Peter Korsgaard
