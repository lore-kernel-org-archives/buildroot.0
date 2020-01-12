From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 15:46:46 +0100
Subject: [Buildroot] Buildroot 2019.11.1 released
Message-ID: <87k15wd961.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.11.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.11.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.11.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.11 release.

- Infrastructure: kconfig: Fix reconfigure logic, python: Ensure
  correct compiler and linker flags are used for compiled code

- Defconfigs: imx6-sabresd: Fix the Qt5 display names,
  imx8: Drop extra copy of U-Boot DTB

- Security fixes for cpio, cups, docker-cli, docker-containerd,
  docker-engine, git, glibc, jasper, libarchive, libgit2, libssh,
  libtomcrypt, nodejs, opencv3, python-django, rabbitmq-c, runc, samba4,
  wavpack

- Fixes for download/compilation/runtime/license issues in acsccid,
  bitcoin, boost, busybox, cmocka, dante, dialog, dillo, easy-rsa,
  ecryptfs-utils, efl, ffmpeg, gdb, gnupg2, go, gpsd, grpc,
  gst1-plugins-bad, iputils, kf5-kcoreaddons, leveldb, libkrb5, libp11,
  librsvg, libuio, libv4l, log4cplus, lrzip, lvm2, mender-grubenv,
  mmc-utils, mosquitto, ntp, openipmi, openpowerlink, openrc, pango,
  pulseaudio, python-brotli, python-gobject, python-pyasn-modules,
  python-pyqt5, python3, qpdf, qt5webengine, quota, rauc, rygel, sdl2,
  snort, sunxi-mali-mainline-driver, syslog-ng, sysrepo, ytree,
  xserver_xorg-server, zip

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.11..

    38  Fabrice Fontaine
    21  Mark Corbin
    14  Peter Korsgaard
    12  Thomas Petazzoni
     9  Bernd Kuhls
     6  Christian Stewart
     4  Adam Duskett
     4  Giulio Benetti
     4  Peter Seiderer
     3  Jan Kundr?t
     3  Michael Vetter
     2  Julien Olivain
     2  Pascal de Bruijn
     2  Paul Cercueil
     2  Ryan Barnett
     2  Titouan Christophe
     2  Yann E. MORIN
     1  Alexey Lukyanchuk
     1  Angelo Compagnucci
     1  Bartosz Bilas
     1  Dan Walkes
     1  Evgeniy Didin
     1  Fabio Estevam
     1  James Byrne
     1  Matt Weber
     1  Nicolas Cavallari
     1  Pierre-Jean Texier
     1  Sergio Prado
     1  Thomas De Schampheleire

-- 
Bye, Peter Korsgaard
