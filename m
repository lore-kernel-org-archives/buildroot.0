From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 21:25:15 +0100
Subject: [Buildroot] Buildroot 2018.02.11 released
Message-ID: <87wolqfe1g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.11 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.11.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.11.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.11 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.10 release.

- Ensure the PLATFORM and OS environment variables are not set, as they
  cause build issues for some packages.

- The package list infrastructure now correctly handles packages
  installing files with old mtime.

- Linux: Skip hash checks for user supplied downloadable patches, as no
  hash checksums are available for those.

- scanpypi: protect against zip-slip vulnerability in zip/tar handling

- Security fixes for bind, dovecot, ghostscript, jpeg-turbo, libarchive,
  libcurl, mosquitto, openssh, php, python, python-django, python3,
  unzip, webkitgtk

- Fixes for download/compilation/runtime issues in dhcpcd, gnuradio,
  libb64, libid3tag, madplay, openssh, postgresql, proftpd, qt5base,
  sqlcipher, swupdate, systemd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.11

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.10..

    12  Peter Korsgaard
    10  Fabrice Fontaine
     5  Baruch Siach
     3  Matt Weber
     3  Thomas De Schampheleire
     3  Yann E. MORIN
     2  Angelo Compagnucci
     2  Bernd Kuhls
     2  Chris Lesiak
     1  Adrian Perez de Castro
     1  David J. Fogle
     1  Gary Bisson
     1  Jim Brennan
     1  J?rg Krause
     1  Mikael Eliasson
     1  Peter Seiderer

-- 
Bye, Peter Korsgaard
