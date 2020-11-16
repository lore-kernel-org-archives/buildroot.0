From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 23:37:47 +0100
Subject: [Buildroot] Buildroot 2020.08.2 released
Message-ID: <87zh3h0vyc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.08.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.08.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.08.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.08.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.08.1 release.

- Fixes for various compilation issues with GCC 10.x.

- Toolchain-wrapper: Pass -fno-tree-loop-distribute-patterns to fix
  kernel build on microblaze with gcc 10.x when optimizations are
  enabled.

- Security fixes for asterisk, bitcoin, cryptsetup, docker-containerd,
  fastd, freetype, jsoncpp, libass, libexif, libpam-tacplus, libraw,
  oniguruma, php, postgresql, redis, samba4, slirp, tcpdump, tmux, tor,
  wireshark

- Fixes for download/compilation/runtime/license issues in apparmor,
  binutils, bitcoin, busybox, collectd, cups-filters, davfs2,
  docker-cli, docker-engine, dovecot-pigeonhole, dvb-apps, elf2flt, gcc,
  ghostscript, grpc, kernel-module-imx-gpu-viv, linux-backports,
  linux-firmware, libnetfilter_conntrack, mp4v2, netsnmp, nginx,
  numactl, opencv3, openntpd, patchelf, pistache, python-pyqt5, qemu,
  qt5base, rauc, samba4, systemd, webkitgtk, wine,
  wireguard-linux-compat, wpewebkit, xen, xorriso, xvisor, zeromq,
  zxing-cpp

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.08.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.08.1..
    50  Fabrice Fontaine
    10  Bernd Kuhls
     9  Peter Korsgaard
     6  Romain Naour
     5  Thomas Petazzoni
     4  Adrian Perez de Castro
     4  Angelo Compagnucci
     2  Antoine Tenart
     2  Bartosz Bilas
     2  Christian Stewart
     2  Julien Olivain
     2  Michael Nosthoff
     2  Yann E. MORIN
     1  Alexander Egorenkov
     1  Alexey Brodkin
     1  Andr? Hentschel
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Baruch Siach
     1  Conrad Ratschan
     1  Dagg Stompler
     1  Doug Kehn
     1  Frank Hunleth
     1  Garret Kelly
     1  Gary Bisson
     1  Klaus Heinrich Kiwi
     1  Matt Weber
     1  Norbert Lange
     1  Ryan Coe
     1  Stefan Agner
     1  Sven Klomp
     1  Vadym Kochan
     1  Waldemar Brodkorb

-- 
Bye, Peter Korsgaard
