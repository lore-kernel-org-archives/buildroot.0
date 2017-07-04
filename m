From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 23:26:10 +0200
Subject: [Buildroot] Buildroot 2017.05.1 released
Message-ID: <874lur28st.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.05.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.05.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.05.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.05.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2017.05 release.

- Security fixes for apache, bind, c-ares, expat, gesftpserver, glibc,
  gnutls, ipsec-tools, irssi, libgcrypt, libmad, mosquitto, mpg123,
  openvpn, spice, systemd, tor, vlc

- Fixes for download/compilation/runtime issues in automake, botan,
  dhcp, fcgiwrap, gcc, gdb, glmark2, gnutls, gst1-plugins-bad,
  imagemagick, imx-uuc, intltool, iperf, kmod, libcurl, libnl, lugaro,
  ncurses, ntp, openssh, qt5base, qt5multimedia, rtl8821au, socat,
  systemd, trinity, tslib, x264, xen, xlib_libxshmfenc,
  xserver_xorg-server.

- Update support/scripts/scancpan to use METACPAN v1 API as v0 has been
  shutdown.

- Update support/scripts/mkusers to handle setups where /etc/shadow is a
  symlink.

- External toolchain: Don't create musl dynamic loader symlink for
  static builds.

- Setlocalversion: Correct detection of mercurial revisions for
  non-tagged versions.

- Defconfigs: at91sam9x5ek_mmc: workaround boot rom issue.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.05..

    17  Peter Korsgaard
    12  Bernd Kuhls
    12  Fabio Estevam
     8  Baruch Siach
     6  Yann E. MORIN
     5  Vicente Olivert Riera
     4  Andrey Smirnov
     3  Thomas Petazzoni
     2  Bartosz Golaszewski
     2  J?rg Krause
     2  Romain Naour
     1  Alexander Dahl
     1  Alexandre Esse
     1  Alistair Francis
     1  Arnout Vandecappelle
     1  Francois Perrad
     1  Jens Maus
     1  Ludovic Desroches
     1  Marcin Nowakowski
     1  Martin Kepplinger
     1  Naoki Matsumoto
     1  Thomas Claveirole
     1  Thomas De Schampheleire
     1  Tobias Blass

-- 
Bye, Peter Korsgaard
