From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 20:22:32 +0100
Subject: [Buildroot] Buildroot 2018.02.10 released
Message-ID: <87ftt81vk7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.10 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.10.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.10.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.10 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.9 release.

- Fixes for Lego EV3 and QEMU AArch64-virt defconfigs

- check-package: fix Python 3 support

- get-developers: Fix behaviour when called from elsewhere than the
  toplevel directory.

- cmake: Also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake

- Security fixes for apache, asterisk, gnupg2, libarchive, libsndfile,
  liburiparser, libxml2, mbedtls, mosquitto, netatalk, openssh, pango,
  php, python-django, python-pyyaml, samba4, sqlite, subversion,
  tcpreplay, wireshark, wolfssl

- Fixes for download/compilation/runtime issues in acpica, apr, cargo,
  cc-tool, dash, dhcpdump, dmalloc, gnuchess, leveldb, libftdi1, libmad,
  libsquish, libwebsock, lighttpd, lm-sensors, lua-msgpack-native,
  nodejs, rauc, s6-networking, sdl_sound, shairport-sync, sunxi-cedarx,
  tekui, webkitgtk, xapp_rgb, xenomai

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.10

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.9..

    29  Peter Korsgaard
    19  Fabrice Fontaine
    10  Baruch Siach
     7  Thomas Petazzoni
     6  Ricardo Martincoski
     4  Bernd Kuhls
     3  Thomas De Schampheleire
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Carlos Santos
     2  Ferdinand van Aartsen
     2  Francois Perrad
     2  Matt Weber
     2  Peter Seiderer
     2  Romain Naour
     2  Yann E. MORIN
     1  Asaf Kahlon
     1  Clayton Shotwell
     1  David Lechner
     1  Gerome Burlats
     1  Gr?goire Delattre
     1  Joshua Henderson
     1  Mark Corbin
     1  Scott Fan
     1  Sergio Prado
     1  Trent Piepho
     1  Vadim Kochan
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
