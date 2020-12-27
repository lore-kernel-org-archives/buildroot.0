From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 18:20:55 +0100
Subject: [Buildroot] Buildroot 2020.02.9 released
Message-ID: <87a6tz9nd4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.9 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.9.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.9.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.9 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.8 release. The 2020.02.x series is
supported until April 2021.

- Infrastructure:
  - cmake: fix host ccache handling for CMake 3.19
  - meson: Forcibly disable binary stripping for target builds, enable
    for host builds
  - golang: Fix HOST / TARGET directories for per-package builds

- Security fixes for c-ares, cryptopp, docker-containerd, imagemagick,
  jasper, jpeg-turbo, libcurl, libkrb5, libopenssl, libressl, mariadb,
  mbedtls, minidlna, musl, mutt, nodejs, openldap, openrc, php, privoxy,
  proftpd, python-flask-cors, python-lxml, raptor, rauc, ruby, slirp,
  sqlcipher, wireshark, x11vnc, xen, xinetd, xserver_xorg-server

- Fixes for download/compilation/runtime/license issues in apitrace,
  arm-trusted-firmware, bustle, cdrkit, dhcpcd, dtv-scan-tables,
  flare-engine, ghostscript, haproxy, imx-gpu-viv, jemalloc, libcap,
  libgpiod, lynx, mutt, ncurses, netsnmp, opencv3, opkg-utils,
  paho-mqtt-c, python-crc16, python-pip, python-pyqt5, qemu, qt5base,
  shadowsocks-libev, ti-sgx-demos, tinycbor, vsftpd, wireless-regdb,
  xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.9

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.8..

    58  Peter Korsgaard
    30  Fabrice Fontaine
     6  Bernd Kuhls
     4  Adam Duskett
     4  Asaf Kahlon
     4  Baruch Siach
     4  Michael Vetter
     3  Romain Naour
     3  Thomas De Schampheleire
     3  Yann E. MORIN
     2  Christian Stewart
     2  Marcin Niestroj
     2  Peter Seiderer
     2  Pierre-Jean Texier
     2  Thomas Petazzoni
     1  Adam Wujek
     1  Bartosz Bilas
     1  Bernd Amend
     1  Christoph M?llner
     1  Francois Perrad
     1  Gleb Mazovetskiy
     1  Heiko Stuebner
     1  Heiko Thiery
     1  James Hilliard
     1  Julien Grossholtz
     1  J?rg Krause
     1  Michael Nosthoff
     1  Tian Yuanhao
     1  Yair Ben-Avraham

-- 
Bye, Peter Korsgaard
