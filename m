From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jul 2019 11:26:48 +0200
Subject: [Buildroot] Buildroot 2019.02.4 released
Message-ID: <87y3169r53.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.4 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02.3 release.

- arch: x86: Fix typo breaking 'core-avx2' variant, add Westmere
  variant.

- linux: Workaround -Werror related build failure on powerpc, by forcing
  CONFIG_PPC_DISABLE_WERROR on.

- Ensure custom <pkg>_OVERRIDE_SRCDIR_RSYNC_EXCLUSIONS are
  passed before the standard exclusions so they are not ignored
  by rsync when using override-srcdir.

- Security fixes for bzip2, dbus, docker-cli, docker-engine, expat,
  faad2, irssi, libgit2, libglib2, mariadb, postgresql, python,
  python-django, python3, samba4, vlc, znc

- Fixes for download/compilation/runtime issues in barebox, davfs2,
  dialog, ffmpeg, freeswitch, gerbera, haveged, libcdaudio, libsecret,
  lmbench, logrotate, meson, mongoose, monit, mpd, php, psplash,
  qt5base, taglib, tvheadend, webkitgtk, xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.4

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.3..

    16  Peter Korsgaard
    10  Fabrice Fontaine
     9  Bernd Kuhls
     4  Pierre-Jean Texier
     3  Esben Haabendal
     2  Giulio Benetti
     2  Jan Kundr?t
     2  J?rg Krause
     2  Markus Mayer
     2  Thomas De Schampheleire
     2  Thomas Petazzoni
     2  Yann E. MORIN
     1  Adam Duskett
     1  Adrian Perez de Castro
     1  Baruch Siach
     1  Brandon Maier
     1  Jared Bents
     1  John Keeping
     1  Julien Olivain
     1  Marcin Niestroj
     1  Peter Seiderer
     1  Romain Naour
     1  Ryan Coe

-- 
Bye, Peter Korsgaard
