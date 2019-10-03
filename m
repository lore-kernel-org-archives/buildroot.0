From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Oct 2019 10:34:17 +0200
Subject: [Buildroot] Buildroot 2019.08.1 released
Message-ID: <87a7ai2po6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.08.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.08.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.08.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.08.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.08 release.

- Defconfigs: fixes for aarch64-efi and beaglebone

- Dependencies: Ensure host has JSON::PP perl module installed if
  webkitgtk/wpewebkit packages are enabled as it is needed during their
  build process.

- Toolchain: Generate check-headers program under BUILD_DIR rather than
  /tmp to fix issues with distributions mounting /tmp noexec.

- Security fixes for cups, asterisk, bind, docker-cli, docker-engine,
  e2fsprogs, exim, expat, go, libcurl, libgcrypt, libnss, libopenssl,
  mariadb, mbedtls, mongodb, mosquitto, nghttp2, nodejs, php, putty,
  samba4, unzip, wireshark

- Fixes for download/compilation/runtime issues in augeas, axel,
  cups-filters, eudev, gcc, haveged, libcamera, libglib2, libgpg-error,
  logrotate, luksmeta, mariadb, mosquitto, nfs-utils, protobuf, qemu,
  snort, systemd-bootchart, thttpd, uclibc, util-linux

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.08..

    25  Peter Korsgaard
     9  Carlos Santos
     8  Bernd Kuhls
     6  Fabrice Fontaine
     5  Giulio Benetti
     3  Pierre-Jean Texier
     3  Ryan Coe
     3  Yegor Yefremov
     2  Christopher McCrory
     2  Max Filippov
     2  Thomas Petazzoni
     2  Vadim Kochan
     2  Vivien Didelot
     1  Adam Duskett
     1  Adrian Perez de Castro
     1  Andr? Hentschel
     1  Asaf Kahlon
     1  Ismael Luceno
     1  Jagan Teki
     1  James Hilliard
     1  Julien Floret
     1  Nicolas Carrier
     1  Peter Seiderer
     1  Rapha?l M?lotte
     1  Refik TUZAKLI
     1  Ricardo Martincoski
     1  Romain Naour
     1  Sergio Prado
     1  Shyam Saini
     1  Simon Rowe
     1  S?bastien Szymanski
     1  Thomas Huth

-- 
Bye, Peter Korsgaard
