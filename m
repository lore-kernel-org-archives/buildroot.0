From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 09 Nov 2019 22:52:09 +0100
Subject: [Buildroot] Buildroot 2019.08.2 released
Message-ID: <874kzclnue.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.08.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.08.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.08.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.08.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.08.1 release.

- Toolchain: Also copy libssp.so for external toolchains if SSP is
  enabled to handle toolchains providing SSP support in libssp rather
  than in the C library

- Download: Also use the package download method for extra downloads
  from the same site, so it does not get confused by URLs containing '+'

- Fakeroot now works correctly under Microsoft Windows 10 Services for
  Linux, which does not provide SYSV IPC support

- Security fixes for asterisk, file, gd, ghostscript, go,
  intel-microcode, libfribidi, libnss, libpcap, mongoose, php, python,
  python3, ruby, samba4, sudo, suricata, tcpdump, wireshark

- Fixes for download/compilation/runtime issues in binutils,
  cups-filters, domoticz, dtc, duma, elf2flt, eudev, exfat, exfat-utils,
  fakeroot, freerdp, gcc, gpsd, grpc, gstreamer1, gvfs, icu,
  kvm-unit-tests, libnss, libopenssl, libpciaccess, librsvg, libseccomp,
  libsigrok, libtorrent, libunwind, libva, linux-tools, lua-sdl2, lxc,
  minizip, mjpegtools, mono, nbd, nfs-utils, piglit, python-autobahn,
  python-snmp-apps, python-tornado, qemu, qt5base, ruby, safeclib,
  sdl_mixer, sox, systemd, unscd, vdr-plugin-vniserver, vtun, xvisor,
  yaffs2utils

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.08.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.08.1..

    26  Fabrice Fontaine
    15  Bernd Kuhls
    10  Peter Korsgaard
     6  Carlos Santos
     6  Thomas Petazzoni
     6  Yann E. MORIN
     5  Giulio Benetti
     5  Romain Naour
     3  Arnout Vandecappelle (Essensium/Mind)
     2  Asaf Kahlon
     2  Baruch Siach
     2  James Hilliard
     2  Matt Weber
     2  Pierre-Jean Texier
     2  Vivien Didelot
     2  Yann Droneaud
     1  Alexey Brodkin
     1  Alexey Lukyanchuk
     1  Andrey Skvortsov
     1  Charlie Turner
     1  Fabio Estevam
     1  Francois Perrad
     1  Heiko Thiery
     1  J?rg Krause
     1  Nicolas Carrier
     1  Patrick Havelange
     1  Paulo Matos
     1  Peter Seiderer
     1  Robert Hancock
     1  Simon Rowe
     1  Wolfgang Grandegger

-- 
Bye, Peter Korsgaard
