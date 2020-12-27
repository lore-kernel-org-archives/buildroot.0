From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 15:38:12 +0100
Subject: [Buildroot] Buildroot 2020.11.1 released
Message-ID: <87im8n9uwb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.11.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.11.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.11.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.11 release.

- Infrastructure:
  - cmake: fix host ccache handling for CMake 3.19
  - meson: Forcibly disable binary stripping for target builds, enable
    for host builds
  - golang: Fix HOST / TARGET directories for per-package builds

- Security fixes for cryptopp, imagemagick, jasper, libcurl, libopenssl,
  libressl, mbedtls, mutt, nodejs, openldap, python-lxml, rauc,
  sqlcipher, unbound, webkitgtk, wireshark, wpewebkit, x11vnc, xen

- Fixes for download/compilation/runtime/license issues in apitrace,
  arm-trusted-firmware, ca-certificates, dhcpcd, dtv-scan-tables,
  flare-engine, ghostscript, go, haproxy, imx-gpu-viv, kismet, lua,
  mongodb, ncurses, netsnmp, opencv3, opkg-utils, paho-mqtt-c,
  python-crc16, qt5base, shadowsocks-libev, suricata, ti-sgx-demos,
  tinycbor, uclibc-ng-test, xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.11..

    27  Fabrice Fontaine
     9  Peter Korsgaard
     4  Bernd Kuhls
     4  Romain Naour
     3  Thomas De Schampheleire
     3  Yann E. MORIN
     2  Adam Duskett
     2  Adrian Perez de Castro
     2  Francois Perrad
     2  Marcin Niestroj
     2  Michael Baudino
     2  Thomas Petazzoni
     1  Adam Wujek
     1  Asaf Kahlon
     1  Baruch Siach
     1  Bernd Amend
     1  Christian Stewart
     1  Christoph M?llner
     1  Gleb Mazovetskiy
     1  Julien Grossholtz
     1  Michael Vetter
     1  Peter Seiderer
     1  Tian Yuanhao

-- 
Bye, Peter Korsgaard
