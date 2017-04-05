From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Apr 2017 17:26:24 +0200
Subject: [Buildroot] Buildroot 2017.02.1 released
Message-ID: <8760iiub8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2017.02.1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.02.1.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.02.1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2017.02.1 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02 release.

- Security fixes for audiofile, gnutls, harfbuzz, imagemagick, jasper,
  mariadb, mbedtls, ntp, openssh, pcre, rpm, samba4, tcpreplay, tor,
  wget, wireshark

- Fixes for compilation/runtime issues in acl, apr, busybox, dbus-cpp,
  domoticsz, elfutils, fakeroot, gdb, git, gst-ffmpeg, gst1-plugins-bad,
  htop, libcec, libiio, libplatform, librsvg, libselinux, libsidplay2,
  libsoc, libwebsockets, libxkbcommon, ltp-testsuite, lttng-libust,
  memcached, mesa3d, mpd, mplayer, nbd, ncftp, opentyrian, perl-gd,
  python, qt5base, rpi-userland, skalibs, slang, sngrep, syslog-ng,
  upmpdcli, xdriver_xf86-video-vmware,

- License information fixes for dbus-glib, dbus-triggerd, cairo, filemq,
  taglib, xlib_libXv, zmqpp,

- Fix a variable clashing issue in the mkusers script with internal bash
  variables

- Improve external toolchain version detection

- Correct permissions for /dev/pts/ptmx when systemd is used with recent
  glibc versions

- Fix python module name clash for graph-depends

- Fakeroot now links against libacl to fix issues on distributions using
  acls

- Ensure that the git download infrastructure creates GNU format
  tar files

- br2-external: Improve error reporting

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02..
    12  Peter Korsgaard
    10  Bernd Kuhls
     8  Arnout Vandecappelle
     8  Thomas Petazzoni
     7  Vicente Olivert Riera
     6  Rahul Bedarkar
     5  Fabio Estevam
     5  Yann E. MORIN
     4  Baruch Siach
     4  Gustavo Zacarias
     4  Peter Seiderer
     4  Romain Naour
     3  Julien BOIBESSOT
     2  J?rg Krause
     2  Kurt Van Dijck
     2  Rodrigo Rebello
     2  Yegor Yefremov
     1  Eric Le Bihan
     1  Fabrice Fontaine
     1  Francois Perrad
     1  Jan Kundr?t
     1  Julien Beraud
     1  Krzysztof Konopko
     1  Matt Weber
     1  Matthew Fornero
     1  Oleg Kitain
     1  Pawel Sikora
     1  Zakharov Vlad

-- 
Bye, Peter Korsgaard
