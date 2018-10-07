From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Oct 2018 09:37:51 +0200
Subject: [Buildroot] Buildroot 2018.02.6 released
Message-ID: <87murqqka8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.6 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.6.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.6.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.6 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.5 release.

- Add a number of patches to fix build errors for host utilities on
  modern distributions using glibc-2.28.

- mkusers: Ensure existing group members are preserved when a group is
  reprocessed.

- printvars: Fix issue with exceeding shell command line length limits
  for certain setups.

- Security fixes for apache, bind, clamav, ghostscript, imagemagick,
  lcms2, libcurl, php, strongswan, webkitgtk, xen

- Fixes for download/compilation/runtime issues in acpid, android-tools,
  bison, cppcms, cramfs, fio, gcc, glibc, gnupg, igmpproxy, imlib2,
  ipsec-tools, libesmtp, libnfs, libssh, libxslt, links, linuxptp,
  mediastreamer, moarvm, parted, php, pv, python-django, qt,
  qt5quickcontrols, qt5webengine, screen, sdl2, shairport-sync,
  squashfs, vboot-utils, x265, xlib_libXfont, xlib_libXft

- New packages (dependencies of webkitgtk): brotli, woff2

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.6

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.5..

    17  Fabrice Fontaine
    16  Peter Korsgaard
     9  Bernd Kuhls
     8  Matt Weber
     7  Adrian Perez de Castro
     6  Giulio Benetti
     5  Fabio Estevam
     2  Gilles Talis
     2  Laurent Hartanerot
     2  Peter Seiderer
     2  Trent Piepho
     1  Carlos Santos
     1  Ferdinand van Aartsen
     1  Johan Oudinet
     1  J?rg Krause
     1  Marcel Patzlaff
     1  Mark Corbin
     1  Max Filippov
     1  Paresh Chaudhary
     1  Peter Thompson
     1  Richard Kunze
     1  Thomas Petazzoni
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
