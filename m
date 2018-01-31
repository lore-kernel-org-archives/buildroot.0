From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 21:08:17 +0100
Subject: [Buildroot] Buildroot 2017.02.10 released
Message-ID: <874ln16bbi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.10 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.10.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.10.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.10 is the 10th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.9 release.

- nconfig: Fix for ncurses/ncursesw linking issue causing crashes.

- System: Only show getty options when busybox init or sysvinit are
  used.

- Infrastructure: Fix build issue for autotools based packages checking
  for C++ support on toolchains without C++ support on a distro lacking
  /lib/cpp (E.G. Arch Linux).

- Security fixes for berkeleydb, bind, clamav, dovecot, intel-microcode,
  irssi, libcurl, mariadb, openocd, php, squid, transmission, webkitgtk,
  wireshark

- Fixes for download/compilation/runtime issues in avahi, busybox,
  ccache, clamav, coreutils, eudev, fis, iputils, kmsxx, liberation,
  libiio, lz4, matchbox-lib, mcookie, pound, rpcbind, tar, util-linux,
  ti-cgt-pru, xen

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.10

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.9..

    21  Bernd Kuhls
     9  Fabio Estevam
     9  Peter Korsgaard
     7  Thomas Petazzoni
     4  Carlos Santos
     3  Adrian Perez de Castro
     3  Yann E. MORIN
     2  Baruch Siach
     2  Vicente Olivert Riera
     1  Alistair Francis
     1  Cam Mannett
     1  Ed Blake
     1  Einar Jon Gunnarsson
     1  Gary Bisson
     1  Guillermo A. Amaral
     1  Gustavo Zacarias
     1  Julien BOIBESSOT
     1  Marcus Folkesson
     1  Mark Hirota
     1  Romain Naour
     1  Ryan Coe

Notice that 2018.02 will become the new LTS release soon and 2017.02.x
will become EOL.

-- 
Bye, Peter Korsgaard
