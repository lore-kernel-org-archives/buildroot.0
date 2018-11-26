From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 23:08:50 +0100
Subject: [Buildroot] Buildroot 2018.08.3 released
Message-ID: <87ftvnsd8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.08.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.08.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.08.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.08.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.08.2 release.

- fs: Drop intermediate tarball from the filesystem handling to
  fix an issue with xattrs handling related to fakeroot. Ensure
  tarball target includes xattrs.

- download: Fix confusion in git submodule handling if dl/ is a
  symlink.

- toolchain: Only allow enabling stack protection on architectures with
  control flow integrity (CFI) support. Only allow FORTIFY_SOURCE
  support on gcc >= 6.

- Defconfigs: Fixes for Armadeus APF27, imx6sabre, Olimex A20
  olinuxino lime legacy, Orangepi zero plus 2.

- Security fixes for bind, elfutils, libcurl, libnss, liburiparser,
  lighttpd, mariadb, mosquitto, network-manager, nginx, openswan,
  postgresql, prosody, ruby, squid, systemd, webkitgtk,
  xserver_xorg-server

- Fixes for download/compilation/runtime issues in attr, audit, busybox,
  brotli, dtc, easydbus, flare-engine, flatcc, gauche, gcc, libiscsi,
  libnfs, libsemanage, lcdproc, lua-curl, mariadb, mmc-utils, neardal,
  netplug, nfs-utils, openocd, p11-kit, qemu, qt, rpm, samba4,
  supertuxkart, systemd, trace-cmd, traceroute, twolame, uclibc,
  usb_modeswitch, webkitgtk, weston, xdriver_xf86-video-geode,
  xlib_libfontenc

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.08.2..

    25  Fabrice Fontaine
    16  Peter Korsgaard
    15  Thomas Petazzoni
     7  Carlos Santos
     6  Bernd Kuhls
     6  Yann E. MORIN
     4  Adrian Perez de Castro
     4  Baruch Siach
     3  Serj Kalichev
     2  Romain Naour
     2  Yegor Yefremov
     1  Alexander Sverdlin
     1  Andreas Naumann
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Fabio Estevam
     1  Ferdinand van Aartsen
     1  Francois Beerten
     1  Grzegorz Blach
     1  Joel Carlson
     1  J?rg Krause
     1  Max Filippov
     1  Nicolas Cavallari
     1  Philipp Wagner
     1  Sergio Prado
     1  S?bastien Szymanski
     1  Thomas Claveirole

-- 
Bye, Peter Korsgaard
