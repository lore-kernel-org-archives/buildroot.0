From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Feb 2019 07:53:31 +0100
Subject: [Buildroot] Buildroot 2018.11.3 released
Message-ID: <87sgwdfzis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.11.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.11.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.11.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.11.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.11.2 release.

- Ensure the PLATFORM and OS environment variables are not set, as they
  cause build issues for some packages.

- The package list infrastructure now correctly handles packages
  installing files with old mtime.

- Linux: Skip hash checks for user supplied downloadable patches, as no
  hash checksums are available for those.

- scanpypi: protect against zip-slip vulnerability in zip/tar handling

- Download: fixes for SSH/SCP support

- SDK: Fix handling of relative symlinks (targets starting with '.' or
  '..')

- Security fixes for bind, dovecot, ghostscript, jpeg-turbo, libarchive,
  libcurl, mosquitto, openssh, php, python, python-django, python3,
  runc, unzip, webkitgtk

- Fixes for download/compilation/runtime issues in dhcpcd,
  docker-compose, docker-engine, dtc, efivar, gnuradio, libb64,
  libgeotiff, libgpiod, libid3tag, libupnp18, log4cplus, madplay, meson,
  openssh, poco, postgresql, proftpd, pulseaudio, qt5base, reaver,
  safeclib, sg3_utils, sqlcipher, swupdate, systemd, xenomai

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.11.2..

    15  Peter Korsgaard
    12  Fabrice Fontaine
     6  Baruch Siach
     5  Thomas De Schampheleire
     3  Matt Weber
     3  Peter Seiderer
     3  Thomas Petazzoni
     3  Yann E. MORIN
     2  Bernd Kuhls
     2  Chris Lesiak
     1  Adrian Perez de Castro
     1  Angelo Compagnucci
     1  Bartosz Golaszewski
     1  Christian Stewart
     1  David J. Fogle
     1  Gary Bisson
     1  Gervais, Francois
     1  Gr?goire Delattre
     1  Jim Brennan
     1  Joel Carlson
     1  Joseph Kogut
     1  J?rg Krause
     1  Mikael Eliasson

-- 
Bye, Peter Korsgaard
