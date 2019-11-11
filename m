From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2019 08:56:57 +0100
Subject: [Buildroot] Buildroot 2019.02.7 released
Message-ID: <87zhh2kfqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.7 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.7.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.7.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.7 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.6 release. The 2019.02.x series is
supported until March 2020.

- Toolchain: Also copy libssp.so for external toolchains if SSP is
  enabled to handle toolchains providing SSP support in libssp rather
  than in the C library

- Download: Also use the package download method for extra downloads
  from the same site, so it does not get confused by URLs containing '+'

- Fakeroot now works correctly under Microsoft Windows 10 Services for
  Linux, which does not provide SYSV IPC support

- Security fixes for asterisk, file, gd, ghostscript, go,
  intel-microcode, libarchive, libnss, libpcap, mongoose, php, python,
  python3, ruby, samba4, sudo, tcpdump

- Fixes for download/compilation/runtime issues in azmq, cups-filters,
  domoticz, duma, elf2flt, eudev, exfat, exfat-utils, fakeroot, freerdp,
  gvfs, kvm-unit-tests, libseccomp, libopenssl, librsvg, libsigrok,
  libtorrent, libunwind, linux-tools, lua-sdl2, lxc, minizip,
  mjpegtools, python-pysnmp-apps, qemu, qt5base, ruby, safeclib,
  sdl_mixer, sox, systemd, unscd, vtun, xvisor, yaffs2utils

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.7

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.6..

    21  Fabrice Fontaine
    14  Peter Korsgaard
    11  Bernd Kuhls
     5  Carlos Santos
     5  Giulio Benetti
     5  Yann E. MORIN
     4  Thomas Petazzoni
     3  Ricardo Martincoski
     3  Romain Naour
     2  Asaf Kahlon
     2  Baruch Siach
     2  Matt Weber
     2  Vivien Didelot
     2  Yann Droneaud
     1  Alexey Brodkin
     1  Alexey Lukyanchuk
     1  Andrey Skvortsov
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Francois Perrad
     1  Heiko Thiery
     1  James Hilliard
     1  Nicolas Carrier
     1  Patrick Havelange
     1  Paulo Matos
     1  Pierre-Jean Texier
     1  Simon Rowe
     1  Wolfgang Grandegger

-- 
Bye, Peter Korsgaard
