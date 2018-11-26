From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 23:58:46 +0100
Subject: [Buildroot] Buildroot 2018.02.8 released
Message-ID: <87bm6bsaxl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.8 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.8.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.8.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.8 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.7 release.

- fs: Drop intermediate tarball from the filesystem handling to
  fix an issue with xattrs handling related to fakeroot. Ensure
  tarball target includes xattrs.

- download: Fix confusion in git submodule handling if dl/ is a
  symlink.

- toolchain: Only allow enabling stack protection on architectures with
  control flow integrity (CFI) support. Only allow FORTIFY_SOURCE
  support on gcc >= 6.

- Defconfigs: Fixes for Armadeus APF27, imx6sabre.

- Security fixes for bind, elfutils, libcurl, libnss, liburiparser,
  lighttpd, mariadb, mosquitto, network-manager, nginx, openswan,
  postgresql, prosody, ruby, squid, systemd, webkitgtk,
  xserver_xorg-server

- Fixes for download/compilation/runtime issues in attr, audit, brotli,
  easydbus, gauche, gcc, lcdproc, libiscsi, libnfs, libsemanage, linux,
  lua-curl, mariadb, mmc-utils, neardal, netplug, nfs-utils, openocd,
  p11-kit, qemu, qt, rpm, samba4, supertuxkart, trace-cmd, traceroute,
  twolame, uclibc, usb_modeswitch, webkitgtk, xdriver_xf86-video-geode,
  xlib_libfontenc

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.8

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.7..

    26  Fabrice Fontaine
    23  Peter Korsgaard
    11  Thomas Petazzoni
     9  Carlos Santos
     8  Baruch Siach
     6  Bernd Kuhls
     4  Adrian Perez de Castro
     3  Serj Kalichev
     3  Yann E. MORIN
     2  Joseph Kogut
     2  Romain Naour
     1  Andreas Naumann
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Fabio Estevam
     1  Grzegorz Blach
     1  Ignacy Gaw?dzki
     1  J?rg Krause
     1  Matt Weber
     1  Max Filippov
     1  Nicolas Cavallari
     1  Philipp Wagner
     1  Sergio Prado
     1  S?bastien Szymanski
     1  Thomas Claveirole
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
