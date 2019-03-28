From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Mar 2019 23:09:06 +0100
Subject: [Buildroot] Buildroot 2018.11.4 released
Message-ID: <874l7mlkhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.11.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.11.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.11.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.11.4 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.11.3 release.

- Security fixes for avahi, busybox, clamav, cups, file, jq, libopenssl,
  libraw, libseccomp, libssh2, mariadb, nodejs, ntp, openjpeg, perl,
  php, putty, rdesktop, samba4, systemd, tor, wireshark, xapp_xdm,
  xlib_libXdmcp

- Fixes for download/compilation/runtime issues in beecrypt, binutils,
  botan, devmem2, efl, fetchmail, fltk, gcc, gdb, git, go,
  gst-plugins-bad, iproute2, kf5-modemmanager-qt, leveldb, libsoxr,
  mosquitto, qt5webkit, runc, swupdate, systemd, vsftpd, wireshark, xen

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11.4

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2018.11.x series is now end of life. Please migrate to
the 2019.02 series instead which will be supported until March 2020.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.11.3..

    19  Fabrice Fontaine
    13  Peter Korsgaard
     7  Bernd Kuhls
     6  Baruch Siach
     3  Christian Stewart
     3  Ga?l PORTAY
     2  Jared Bents
     2  J?rg Krause
     2  Xavier Ruppen
     1  Abdelmalek Benelouezzane
     1  Alexey Brodkin
     1  Artem Panfilov
     1  Norbert Lange
     1  Ryan Coe
     1  Thomas De Schampheleire
     1  Vadim Kochan

-- 
Bye, Peter Korsgaard
