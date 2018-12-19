From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Dec 2018 23:25:27 +0100
Subject: [Buildroot] Buildroot 2018.11.1 released
Message-ID: <87k1k5upbc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.11.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.11.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.11.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.11 release.

- Fix a runtime error in docker engine by bumping to the v18.09.0
  release. This splits off the client side in the docker-cli package.

- Security fixes for go, nodejs, php, lxc, webkitgtk, xen

- Fixes for download/compilation/runtime issues in asterisk,
  docker-compose, docker-engine, dt-utils, gnutls, grub, libiscsi,
  liblo, libmpd, liboping, libpam-tacplus, libpjsip, liquid-dsp,
  lua-cqueues, luvi, lxc, lynx, nginx, openzwave, pps-tools, prosody,
  sdl2_net, swupdate, uclibc, vte, wine

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.11.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.11..

    11  Peter Korsgaard
    11  Thomas Petazzoni
     9  Fabrice Fontaine
     4  Bernd Kuhls
     3  Yann E. MORIN
     2  Joel Stanley
     2  Trent Piepho
     1  Adrian Perez de Castro
     1  Carlos Santos
     1  Christian Stewart
     1  Damien Th?bault
     1  Ezequiel Garcia
     1  Francois Perrad
     1  Jared Bents
     1  J?rg Krause
     1  Max Filippov
     1  Romain Naour
     1  Waldemar Brodkorb

-- 
Bye, Peter Korsgaard
