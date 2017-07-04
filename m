From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 19:11:48 +0200
Subject: [Buildroot] Buildroot 2017.02.4 released
Message-ID: <87d19g160b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.4 is the 4th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.3 release.

- Security fixes for apache, bind, c-ares, expat, gesftpserver, glibc,
  gnutls, ipsec-tools, irssi, libgcrypt, libmad, mosquitto, mpg123,
  openvpn, spice, systemd, tor, vlc

- Fixes for download/compilation/runtime issues in automake, botan,
  dhcp, fcgiwrap, gcc, gdb, gnutls, gst1-plugins-bad, imagemagick,
  imx-uuc, intltool, iperf, libnl, ncurses, nodejs, ntp, openssh,
  qt5base, qt5multimedia, rtl8821au, socat, systemd, tslib, x264,
  xserver_xorg-server,

- Update support/scripts/scancpan to use METACPAN v1 API as v0 has been
  shutdown.

- Update support/scripts/mkusers to handle setups where /etc/shadow is a
  symlink.

- External toolchain: Don't create musl dynamic loader symlink for
  static builds.

- Setlocalversion: Correct detection of mercurial revisions for
  non-tagged versions.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.3..

    26  Peter Korsgaard
    11  Bernd Kuhls
     8  Baruch Siach
     6  Fabio Estevam
     6  Vicente Olivert Riera
     6  Yann E. MORIN
     3  Andrey Smirnov
     2  Bartosz Golaszewski
     2  J?rg Krause
     2  Thomas Petazzoni
     1  Adam Duskett
     1  Alexander Dahl
     1  Alexandre Esse
     1  Francois Perrad
     1  Jens Maus
     1  Martin Kepplinger
     1  Rodrigo Rebello
     1  Romain Naour
     1  Thomas Claveirole
     1  Thomas De Schampheleire
     1  Tobias Blass

-- 
Bye, Peter Korsgaard
