From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Dec 2018 11:15:57 +0100
Subject: [Buildroot] Buildroot 2018.08.4 released / EOL
Message-ID: <87ftusv6zm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.08.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.08.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.08.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.08.4 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.08.3 release.

- Security fixes for freetype, ghostscript, libopenssl, nodejs, php,
  python-requests, samba4, webkitgtk

- Fixes for download/compilation/runtime issues in dante,
  docker-compose, domoticz, gnutls, libgpgme, libid3tag, libiscsi,
  libmpd, liboping, libpjsip, linux, liquid-dsp, luvi, lynx, msgpack,
  nginx, php, popt, pps-tools, prosody, python-numpy, sdl2_net,
  swupdate, systemd, uclibc, vte, wine, xfsprogs

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08.4

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.08.3..

    12  Peter Korsgaard
    11  Fabrice Fontaine
     8  Yann E. MORIN
     7  Thomas Petazzoni
     6  Bernd Kuhls
     2  Asaf Kahlon
     2  Joel Stanley
     2  Trent Piepho
     1  Adrian Perez de Castro
     1  Damien Th?bault
     1  Ezequiel Garcia
     1  Florian Fainelli
     1  Francois Perrad
     1  Jared Bents
     1  J?rg Krause
     1  Martin Bark
     1  Max Filippov
     1  Peter Seiderer
     1  Waldemar Brodkorb

Notice that the 2018.08.x series is now EOL. Users are urged to migrate
to 2018.11 (current release) or 2018.02 (long term release) instead.

-- 
Bye, Peter Korsgaard
