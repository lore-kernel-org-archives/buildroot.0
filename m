From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2020 08:56:27 +0100
Subject: [Buildroot] Buildroot 2020.02.8 released
Message-ID: <87v9e41kno.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.8 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.8.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.8.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.8 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.7 release. The 2020.02.x series is
supported until April 2021.

- Security fixes for angularjs, asterisk, bitcoin, cryptsetup,
  docker-containerd, fastd, freetype, jsoncpp, libass, libexif,
  libpam-tacplus, libraw, oniguruma, php, postgresql, redis, samba4,
  slirp, tcpdump, tmux, tor, wireshark

- Fixes for download/compilation/runtime/license issues in bitcoin,
  busybox, davfs2, docker-cli, docker-engine, dovecot-pigeonhole, gcc,
  ghostscript, gnuradio, grpc, keepalived, libpam-tacplus,
  linux-backports, linux-firmware, netsnmp, nginx, opencv3, openntpd,
  patchelf, python-pyqt5, qt5base, rauc, samba4, systemd, webkitgtk,
  wireguard-linux-compat, wpewebkit, xen, xorriso, zeromq, zxing-cpp

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.8

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.7..

    40  Fabrice Fontaine
    12  Bernd Kuhls
    11  Peter Korsgaard
     5  Thomas Petazzoni
     4  Adrian Perez de Castro
     3  Angelo Compagnucci
     2  Antoine Tenart
     2  Bartosz Bilas
     2  Christian Stewart
     2  Julien Olivain
     2  Michael Nosthoff
     2  Romain Naour
     1  Alexey Brodkin
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Baruch Siach
     1  Conrad Ratschan
     1  Doug Kehn
     1  Frank Hunleth
     1  Garret Kelly
     1  Gary Bisson
     1  Gwenhael Goavec-Merou
     1  Ignacy Gaw?dzki
     1  Matt Weber
     1  Norbert Lange
     1  Ryan Coe
     1  Sven Klomp
     1  Vadym Kochan
     1  Waldemar Brodkorb
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
