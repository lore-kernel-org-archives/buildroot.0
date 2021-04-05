From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Apr 2021 13:59:33 +0200
Subject: [Buildroot] Buildroot 2020.02.12 released
Message-ID: <87a6qduel6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.12 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.12.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.12.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.12 is a bugfix release on the previous long term
release, fixing a number of important / security related issues
discovered since the 2020.02.11 release.

Notice that the 2020.02.x series is now end of life unless somebody
steps up to take over maintenance. Please migrate to the 2021.02 series
instead which will be supported until April 2022.

- Dependencies: Explicitly detect and bail out if PATH contains spaces
  or tabs. A number of packages fail to build in such setups, so
  explicitly inform about this.

- utils/scanpypi: Explicitly use python3 for compatibility with packages
  using python3 syntax in setup.py

- support/download: Fix tarball generation (from git/svn repos)
  including symlinks pointing to ./<something>

- Meson: Use correct C++ host compiler (rather than C compiler)

- Security fixes for bind, docker-containerd, git, gnuchess, gnutls,
  grub2, haserl, imagemagick, libcurl, libebml, libglib2, libopenssl,
  lldpd, mariadb, mbedtls, mosquitto, nodejs, openldap, openssh,
  privoxy, prosody, python-aiohttp, python-django, python-lxml,
  python-pyyaml, python3, redis, rpm, screen, sqlcipher, squid, tor,
  upx, wireshark, wolfssl, wpa_supplicant, zstd

- Fixes for download/compilation/runtime/license issues in asterisk,
  batman-adv, dovecot, dovecot-pigeonhole, efivar, fakeroot, irqbalance,
  jasper, kodi, libjpeg, libupnp, libvips, netsnmp, opkg-utils, perl,
  php, protobuf, python-rpi-ws281x, sconeserver, sox, sysvinit,
  transmission, tzdata, uboot, util-linux

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.12

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.11..

    35  Fabrice Fontaine
    17  Peter Korsgaard
    13  Peter Seiderer
    10  Bernd Kuhls
     6  Ryan Barnett
     5  Giulio Benetti
     4  Francois Perrad
     4  Yann E. MORIN
     3  Baruch Siach
     3  Christian Stewart
     3  Michael Vetter
     3  Petr Vorel
     2  Marcin Niestroj
     2  Thomas Petazzoni
     1  Asaf Kahlon
     1  Bert Outtier
     1  Grzegorz Blach
     1  James Hilliard
     1  Jean-pierre Cartal
     1  John Keeping
     1  J?rg Krause
     1  Michael Nosthoff
     1  Nicolas Cavallari
     1  Nicolas Serafini
     1  Nicolas Toromanoff
     1  Romain Naour
     1  Scott Fan
     1  Stefan S?rensen
     1  Thomas De Schampheleire
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
