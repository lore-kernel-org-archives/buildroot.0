From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Jun 2017 11:18:15 +0200
Subject: [Buildroot] Buildroot 2017.02.3 released
Message-ID: <87poemg33c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2017.02.3 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.02.3.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.02.3.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2017.02.3 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.2 release.

- Security fixes for audiofile, dropbear, elfutils, flashrom, git,
  libmicrohttpd, libminiupnpc, libtasn1, mariadb, mosquitto, openvpn,
  postgresql, rpcbind, rtmpdump, samba4, strongswan, sudo, vlc

- Fixes for download/compilation/runtime issues in armadillo, audiofile,
  bash, bluez_utils, cppcms, dbus, dhcp, efibootmgr, efl, faketime,
  fbgrab, ftop, gdb, gpsd, hans, kvm-unit-tests, kyua, libevdev,
  libubox, ltp-testsuite, lua, madplay, mono, mxml, ntp, nvidia-driver,
  openblas, oracle-mysql, picocom, popt, pulseview, qt5base, qwt,
  rabbitmq-c, redis, strongswan, sudo

- Download: <pkg>-source-check fixed for packages from git.

- External toolchain: musl dynamic linker symlink for mips-sf corrected.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.2..

    16  Bernd Kuhls
    15  Peter Korsgaard
    11  Romain Naour
     9  Thomas Petazzoni
     8  Vicente Olivert Riera
     6  Baruch Siach
     5  Yann E. MORIN
     2  Dustin Johnson
     2  Fabrice Fontaine
     1  Bartosz Golaszewski
     1  Daniel Sabogal
     1  Danomi Manchego
     1  Gwenhael Goavec-Merou
     1  Jeroen Roovers
     1  Peter Seiderer
     1  Ryan Coe

-- 
Bye, Peter Korsgaard
