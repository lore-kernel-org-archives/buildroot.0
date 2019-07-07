From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 22:29:12 +0200
Subject: [Buildroot] Buildroot 2019.05.1 released
Message-ID: <8736jhbnc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.05.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.05.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.05.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.05.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.05 release.

- Security fixes for bzip2, dbus, docker-cli, docker-engine, exim,
  expat, faad2, irssi, libgit2, libglib2, mariadb, postgresql, python,
  python3, python-django, samba4, vlc, znc

- Fixes for download/compilation/runtime issues in barebox, busybox,
  davfs2, dialog, freeswitch, gerbera, grpc, libcamera, libcdaudio,
  libcurl, libressl, libsecret, lmbench, localedef, meson, mongoose,
  monit, mpd, ncmpc, openjdk, php, qt5base, taglib, tvheadend, weston,
  webkitgtk, xserver-xorg_server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.05.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.05..

    20  Peter Korsgaard
    14  Fabrice Fontaine
     8  Bernd Kuhls
     4  Pierre-Jean Texier
     3  Esben Haabendal
     3  Markus Mayer
     2  Adam Duskett
     2  Giulio Benetti
     2  Jan Kundr?t
     2  J?rg Krause
     2  Mirza Krak
     2  Thomas De Schampheleire
     2  Thomas Petazzoni
     2  Yann E. MORIN
     1  Adrian Perez de Castro
     1  Baruch Siach
     1  Brandon Maier
     1  Francois Perrad
     1  Jared Bents
     1  John Keeping
     1  Julien Olivain
     1  Kieran Bingham
     1  Marcin Niestroj
     1  Nylon Chen
     1  Peter Seiderer
     1  Romain Naour
     1  Ryan Coe
     1  Samuel Mendoza-Jonas

-- 
Bye, Peter Korsgaard
