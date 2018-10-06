From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Oct 2018 15:53:51 +0200
Subject: [Buildroot] Buildroot 2018.05.3 released
Message-ID: <87bm87yyds.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.05.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.05.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.05.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.05.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.05.2 release.

- Add a number of patches to fix build errors for host utilities on
  modern distributions using glibc-2.28.

- mkusers: Ensure existing group members are preserved when a group is
  reprocessed.

- printvars: Fix issue with exceeding shell command line length limits
  for certain setups.

- Security fixes for apache, bind, clamav, ghostscript, imagemagick,
  lcms2, libcurl, php, postgresql, strongswan, webkitgtk, xen

- Fixes for download/compilation/runtime issues in acpid, android-tools,
  bison, chipmunk, gcc, gnupg, ipsec-tools, libssh, libxslt, links,
  mediastreamer, moarvm, parted, php, pv, python-django, qt,
  qt5quickcontrols, qt5webengine, screen, sdl2, shairport-sync,
  squashfs, vboot-utils, x265, xlib_libXfont, xlib_libXft,
  xlib_libxshmfence, zeromq

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.05.2..

    15  Fabrice Fontaine
    14  Peter Korsgaard
     9  Bernd Kuhls
     8  Matt Weber
     5  Fabio Estevam
     5  Giulio Benetti
     3  Laurent Hartanerot
     3  Thomas Petazzoni
     2  Adrian Perez de Castro
     2  Gilles Talis
     2  J?rg Krause
     2  Trent Piepho
     1  Adam Duskett
     1  Carlos Santos
     1  Ferdinand van Aartsen
     1  Johan Oudinet
     1  Marcel Patzlaff
     1  Mark Corbin
     1  Max Filippov
     1  Paresh Chaudhary
     1  Peter Thompson
     1  Richard Kunze
     1  Romain Naour
     1  Yann E. MORIN

Notice that the 2018.05.x series is now EOL. Users are urged to migrate
to 2018.08 (current release) or 2018.02 (long term release) instead.

-- 
Bye, Peter Korsgaard
