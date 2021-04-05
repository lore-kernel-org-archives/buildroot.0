From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Apr 2021 12:09:06 +0200
Subject: [Buildroot] Buildroot 2020.11.4 released
Message-ID: <87eefpujp9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.11.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.11.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.11.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.11.4 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.11.3 release.

- Dependencies: Explicitly detect and bail out if PATH contains spaces
  or tabs. A number of packages fail to build in such setups, so
  explicitly inform about this.

- support/download: Fix tarball generation (from git/svn repos)
  including symlinks pointing to ./<something>

- Meson: Use correct C++ host compiler (rather than C compiler)

- utils/scanpypi: Explicitly use python3 for compatibility with packages
  using python3 syntax in setup.py

- Security fixes for bind, docker-containerd, git, gnuchess, gnutls, go,
  grub2, haserl, imagemagick, libcurl, libebml, libglib2, libopenssl,
  libressl, lldpd, mariadb, mbedtls, mosquitto, nodejs, openldap,
  openssh, privoxy, prosody, python-aiohttp, python-django, python-lxml,
  python-pyyaml, python3, redis, rpm, screen, sqlcipher, squid, tor,
  upx, webkitgtk, wireshark, wolfssl, wpa_supplicant, wpewebkit, zstd

- Fixes for download/compilation/runtime/license issues in asterisk,
  at91bootstrap, babeltrace2, batman-adv, cog, dovecot,
  dovecot-pigeonhole, efivar, elfutils, fakeroot, gnuradio, i7z,
  intel-mediasdk, irqbalance, jasper, kodi, libeXosip2, libjpeg, libqmi,
  libupnp, libuwsc, libvips, mender, micropython, netsnmp, openblas,
  opkg-utils, optee-client, optee-test, perl, php, proftpd, protobuf,
  python-rpi-ws281x, quagga, qwt, sconeserver, sox, suricata, syslinux,
  sysvinit, transmission, uboot, unbound, util-linux, wpebackend-fdo

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11.4

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2020.11.x series is now END OF LIFE. Please migrate to
the 2021.02.x series instead which will be supported until March 2022.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.11.3..

    45  Fabrice Fontaine
    18  Peter Korsgaard
    16  Peter Seiderer
     7  Bernd Kuhls
     6  Adrian Perez de Castro
     6  Ryan Barnett
     5  Giulio Benetti
     4  Yann E. MORIN
     3  Adam Duskett
     3  Christian Stewart
     3  Michael Vetter
     3  Petr Vorel
     3  Thomas De Schampheleire
     3  Thomas Petazzoni
     2  Marcin Niestroj
     2  Titouan Christophe
     1  Asaf Kahlon
     1  Bartosz Bilas
     1  Baruch Siach
     1  Bert Outtier
     1  Chris Packham
     1  Edgar Bonet
     1  Etienne Carriere
     1  Francois Perrad
     1  Grzegorz Blach
     1  Gwenhael Goavec-Merou
     1  Ismael Luceno
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
     1  Stefan Ott
     1  Stefan S?rensen

-- 
Bye, Peter Korsgaard
