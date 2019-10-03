From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Oct 2019 17:37:44 +0200
Subject: [Buildroot] Buildroot 2019.05.3 released
Message-ID: <874l0p3kmv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.05.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.05.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.05.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.05.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.05.2 release.

- Defconfigs: fixes for aarch64-efi and beaglebone

- Dependencies: Ensure host has JSON::PP perl module installed if
  webkitgtk/wpewebkit packages are enabled as it is needed during their
  build process.

- Toolchain: Generate check-headers program under BUILD_DIR rather than
  /tmp to fix issues with distributions mounting /tmp noexec.

- Security fixes for asterisk, bind, cups, docker-cli, docker-engine,
  e2fsprogs, exim, expat, go, libcurl, libgcrypt, libnss, libopenssl,
  mariadb, mbedtls, mongodb, mosquitto, nghttp2, nodejs, php, putty,
  samba4, unzip, wireshark

- Fixes for download/compilation/runtime issues in augeas, cups-filters,
  dropbear, e2fsprogs, eudev, gcc, haveged, iptables, libcamera,
  libgpg-error, libtorrent-rasterbar, luksmeta, mariadb, nfs-utils,
  openvmtools, protobuf, qemu, systemd-bootchart, thttpd, uclibc,
  util-linux

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05.3

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2019.05.x series is now end of life. Please migrate to
either the 2019.08 series (supported until December 2019) or the 2019.02
series instead which will be supported until March 2020.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.05.2..

    25  Peter Korsgaard
     9  Bernd Kuhls
     9  Carlos Santos
     6  Fabrice Fontaine
     6  Giulio Benetti
     4  Baruch Siach
     4  Ryan Coe
     3  Yegor Yefremov
     2  Christopher McCrory
     2  J?rg Krause
     2  Max Filippov
     2  Pierre-Jean Texier
     2  Romain Naour
     2  Thomas Petazzoni
     2  Vivien Didelot
     1  Adrian Perez de Castro
     1  Andr? Hentschel
     1  Asaf Kahlon
     1  Jagan Teki
     1  James Hilliard
     1  Julien Floret
     1  Nicolas Carrier
     1  Peter Seiderer
     1  Rapha?l M?lotte
     1  Refik TUZAKLI
     1  Ricardo Martincoski
     1  Sam Bobroff
     1  Shyam Saini
     1  Simon Rowe
     1  S?bastien Szymanski
     1  Thomas Huth
     1  Titouan Christophe
     1  Vadim Kochan

-- 
Bye, Peter Korsgaard
