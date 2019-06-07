From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jun 2019 10:28:44 +0200
Subject: [Buildroot] Buildroot 2019.02.3 released
Message-ID: <87ef45dcjn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.3 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.2 release.

- Infra: pkg-config: Use a dedicated timestamp file rather than
  .config as that gets touched by linux-4.19+, causing repeated
  builds.

- check-bin-arch: Also ignore /usr/lib/grub to support merged
  /usr setups, similar to how /lib/grub is ignored.

- gnuconfig/config.sub: Add C-SKY architecture support.

- Security fixes for atftp, cjson, dovecot, exim, gst1-plugins-base,
  imagemagick, intel-microcode, libcurl, libnss, libopenssl, pcsc-lite,
  php, postgresql, python, python-django, samba4, sqlite, webkitgtk

- Fixes for download/compilation/runtime issues in assimp, atop, botan,
  chocolate-doom, coreutils, cracklib, ddrescue, docker-cli,
  docker-containerd, docker-engine, dosfstools, ffmpeg, flare-engine,
  gcc, gdb, gerbera, glibmm, go, gpsd, gst-ffmpeg, gst1-plugins-bad,
  jasper, kf5-kcoreaddons, kismet, libglib2, libssh2, libupnp18,
  linuxptp, lynx, matchbox-panel, mender, netcat-openbsd, netsurf,
  nfs-utils, opus, orc, owfs, pcsc-lite, postgresql, python-cython,
  qt5enginio, rpm, runc, samba4, subversion, supertux, systemd, tslib,
  uclibc, v4l2loopback

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.2..

    35  Peter Korsgaard
    25  Fabrice Fontaine
    18  Peter Seiderer
    15  Giulio Benetti
     6  Bernd Kuhls
     6  Thomas Petazzoni
     5  J?rg Krause
     4  Christian Stewart
     3  Mirza Krak
     3  Vadim Kochan
     2  Adam Duskett
     2  Angelo Compagnucci
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Asaf Kahlon
     2  James Hilliard
     2  Markus Mayer
     2  Martin Kepplinger
     2  Yann E. MORIN
     1  Adrian Perez de Castro
     1  Alex Xu
     1  Artem Panfilov
     1  Charlie Turner
     1  Francois Perrad
     1  Grzegorz Blach
     1  Guo Ren
     1  John Keeping
     1  Jonah Petri
     1  Max Filippov
     1  Petr Vorel
     1  Romain Naour
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
