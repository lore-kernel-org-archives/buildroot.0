From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 May 2017 09:11:45 +0200
Subject: [Buildroot] Buildroot 2017.02.2 released
Message-ID: <87a86venri.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2017.02.2 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2017.02.2.tar.gz

or

http://buildroot.net/downloads/buildroot-2017.02.2.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2017.02.2 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.1 release.

- Security fixes for bind, dovecot, freetype, ghostscript, icu,
  imagemagick, libcroco, libcurl, libnl, libnss, libsamplerate,
  libsndfile, minicom, python-django, python-web2py, tiff, wireshark,
  xen

- Fixes for compilation/runtime issues in glibc, gst-plugins-base,
  gst1-plugins-base, hiredis, libnspr, libunwind, mplayer, mpv, nodejs,
  samba4, syslinux, systemd, trinity

- License information fixes for freetype, icu, python-pyyaml

- Ensure that the Python package infrastructure ignores user
  site-package directory (#9791)

- Fix for a download issue with the external Codesourcery toolchains
  (http vs https)

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.1..
    18  Peter Korsgaard
    12  Vicente Olivert Riera
     8  Bernd Kuhls
     7  Romain Naour
     5  Baruch Siach
     3  Thomas Petazzoni
     2  Rahul Bedarkar
     2  Ricardo Martincoski
     1  Arnout Vandecappelle
     1  Beno?t Allard
     1  Carlos Santos
     1  Christian Stewart
     1  J?rg Krause
     1  Matt Weber
     1  Waldemar Brodkorb
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
