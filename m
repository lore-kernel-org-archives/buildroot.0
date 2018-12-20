From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 14:12:20 +0100
Subject: [Buildroot] Buildroot 2018.02.9 released
Message-ID: <87bm5guytn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.9 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.9.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.9.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.9 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.8 release.

- Defconfigs: Fixes for ci20

- Security fixes for freetype, ghostscript, glibc, go, libopenssl,
  nodejs, php, python-requests, samba4, webkitgtk

- Fixes for download/compilation/runtime issues in dante, gnutls,
  libcurl, libgpgme, libid3tag, libiscsi, libmpd, libpjsip, linux,
  liquid-dsp, luvi, lynx, msgpack, nginx, php, popt, pps-tools,
  python-numpy, sdl2_net, squashfs, swupdate, uclibc, wine, xfsprogs

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.9

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.8..

    13  Peter Korsgaard
     8  Bernd Kuhls
     8  Fabrice Fontaine
     6  Thomas Petazzoni
     5  Yann E. MORIN
     2  Asaf Kahlon
     2  J?rg Krause
     2  Trent Piepho
     1  Adrian Perez de Castro
     1  Ezequiel Garcia
     1  Florian Fainelli
     1  Jared Bents
     1  Joel Stanley
     1  Julien Corjon
     1  Martin Bark
     1  Max Filippov
     1  Peter Seiderer
     1  Waldemar Brodkorb

-- 
Bye, Peter Korsgaard
