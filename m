From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Mar 2019 16:08:19 +0100
Subject: [Buildroot] Buildroot 2018.02.12 released, 2018.02.x is EOL
Message-ID: <87ef6pk9b0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.12 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.12.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.12.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.12 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.11 release.

- Security fixes for avahi, busybox, clamav, cups, file, jq, libopenssl,
  libraw, libseccomp, libssh2, mariadb, nodejs, ntp, openjpeg, perl,
  php, putty, rdesktop, wireshark, xapp_xdm, xlib_libXdmcp

- Fixes for download/compilation/runtime issues in beecrypt, devmem2,
  fetchmail, fltk, gcc, gdb, git, leveldb, libunistring, mosquitto,
  qt5webkit, systemd, vsftpd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.12

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2018.02.x series is now end of life. Please migrate to
the 2019.02 series instead which will be supported until March 2020.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.11..

    17  Fabrice Fontaine
    12  Peter Korsgaard
     9  Bernd Kuhls
     8  Baruch Siach
     3  Ga?l PORTAY
     2  Jared Bents
     2  Xavier Ruppen
     1  Abdelmalek Benelouezzane
     1  Alexey Brodkin
     1  Artem Panfilov
     1  Giulio Benetti
     1  Joseph Kogut
     1  Romain Naour

-- 
Bye, Peter Korsgaard
