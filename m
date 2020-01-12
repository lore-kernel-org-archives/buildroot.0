From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 19:55:59 +0100
Subject: [Buildroot] Buildroot 2019.02.9 released
Message-ID: <87blr8cxmo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.9 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.9.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.9.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.9 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.8 release. The 2019.02.x series is
supported until March 2020.

- pkg-python infrastructure: Ensure correct compiler and linker flags
  are used for compiled code

- Security fixes for cpio, cups, docker-cli, docker-containerd,
  docker-engine, git, glibc, libarchive, libgit2, libssh, libtomcrypt,
  nodejs, opencv3, python-django, python-ecdsa, runc, samba4, wavpack

- Fixes for download/compilation/runtime/license issues in busybox,
  dante, dillo, easy-rsa, ecryptfs-utils, efl, gnupg2, gst1-plugins-bad,
  kf5-kcoreaddons, libkrb5, librsvg, libuio, lvm2, ntp, openpowerlink,
  python-pyasn-modules, python-pyqt5, python-subprocess32, python3,
  qpdf, rygel, sdl, xserver_xorg-server, zip

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.8

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.8..

    21  Mark Corbin
    19  Fabrice Fontaine
    15  Peter Korsgaard
     7  Thomas Petazzoni
     5  Bernd Kuhls
     5  Christian Stewart
     3  Giulio Benetti
     2  Adam Duskett
     2  Asaf Kahlon
     2  Paul Cercueil
     2  Peter Seiderer
     2  Ryan Barnett
     2  Yann E. MORIN
     1  Baruch Siach
     1  Dan Walkes
     1  James Byrne
     1  Julien Olivain
     1  Matt Weber
     1  Pascal de Bruijn
     1  Pierre-Jean Texier
     1  Thomas De Schampheleire
     1  Thomas Preston

-- 
Bye, Peter Korsgaard
