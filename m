From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 17:10:08 +0100
Subject: [Buildroot] Buildroot 2020.08.3 released, 2020.08.x series EOL
Message-ID: <87eejb9qn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.08.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.08.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.08.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.08.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.08.2 release.

- Infrastructure:
  - cmake: fix host ccache handling for CMake 3.19
  - meson: Forcibly disable binary stripping for target builds, enable
    for host builds
  - golang: Fix HOST / TARGET directories for per-package builds

- Security fixes for c-ares, cryptopp, docker-containerd, imagemagick,
  jasper, jpeg-turbo, libcurl, libkrb5, libopenssl, libressl, mariadb,
  mbedtls, minidlna, musl, mutt, nodejs, openldap, openrc, php, privoxy,
  proftpd, python-flask-cors, python-lxml, raptor, rauc, ruby, slirp,
  sqlcipher, unbound, wireshark, x11vnc, xen, xinetd,
  xserver_xorg-server

- Fixes for download/compilation/runtime/license issues in apitrace,
  arm-trusted-firmware, bustle, ca-certificates, cage, cdrkit, dhcpcd,
  dtv-scan-tables, flare-engine, ghostscript, haproxy, imx-gpu-viv,
  jemalloc, libcamera, libcap, libgpiod, lynx, mongodb, mutt, ncurses,
  netsnmp, netsurf, opencv3, openrc, opkg-utils, paho-mqtt-c,
  python-crc16, python-pip, python-pyqt5, qemu, qt5base,
  shadowsocks-libev, thermald, ti-sgx-demos, tinycbor, vsftpd, wlroots,
For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08.3

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2020.08.x series is now end of life. Please migrate to
the 2020.11.x series instead which will be supported until March 2021.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.08.2..

    38  Fabrice Fontaine
    27  Peter Korsgaard
     6  Bernd Kuhls
     4  Baruch Siach
     4  Michael Vetter
     3  Peter Seiderer
     3  Romain Naour
     3  Thomas De Schampheleire
     3  Yann E. MORIN
     2  Adam Duskett
     2  Christian Stewart
     2  Heiko Thiery
     2  Marcin Niestroj
     2  Michael Nosthoff
     2  Paul Cercueil
     2  Thomas Petazzoni
     1  Adam Wujek
     1  Asaf Kahlon
     1  Bartosz Bilas
     1  Bernd Amend
     1  Christoph M?llner
     1  Francois Perrad
     1  Gleb Mazovetskiy
     1  Heiko Stuebner
     1  Julien Grossholtz
     1  Pierre-Jean Texier
     1  Sergio Prado
     1  Stefan Ott
     1  Tian Yuanhao

-- 
Bye, Peter Korsgaard
