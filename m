From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Oct 2018 11:42:51 +0200
Subject: [Buildroot] Buildroot 2018.08.1 released
Message-ID: <87in2eqehw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.08.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.08.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.08.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.08.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.08 release.

- Add a number of patches to fix build errors for host utilities on
  modern distributions using glibc-2.28.

- mkusers: Ensure existing group members are preserved when a group is
  reprocessed.

- printvars: Fix issue with exceeding shell command line length limits
  for certain setups.

- Security fixes for apache, bind, clamav, ghostscript, mosquitto, php,
  strongswan, webkitgtk, xen

- Fixes for download/compilation/runtime issues in acpid, android-tools,
  brltty, cppcms, domoticz, dtc, fio, gcc, gdb, gnupg, igmpproxy, imlib2,
  ipsec-tools, libesmtp, libnfs, libxslt, links, lua, parted,
  python-django, screen, shairport-sync, vboot-utils, x265,
  xlib_libXdmcp, xlib_libXfont, xlib_libXft, xlib_libxshmfence,
  xutil_makedepend, zeromq

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.08.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.08..

    14  Fabrice Fontaine
     9  Peter Korsgaard
     8  Bernd Kuhls
     7  Matt Weber
     4  Thomas Petazzoni
     3  Fabio Estevam
     3  Giulio Benetti
     3  Romain Naour
     2  Adrian Perez de Castro
     2  Gilles Talis
     2  Trent Piepho
     1  Carlos Santos
     1  Ferdinand van Aartsen
     1  Joel Stanley
     1  Johan Oudinet
     1  J?rg Krause
     1  Marcel Patzlaff
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
