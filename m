From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Apr 2020 18:28:14 +0200
Subject: [Buildroot] Buildroot 2019.02.11 released, 2019.02.x is EOL
Message-ID: <87v9m8fwtd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.11 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.11.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.11.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.11 is a bugfix release on the previous long term
release, fixing a number of important / security related issues
discovered since the 2019.02.10 release.

Notice that the 2019.02.x series is now end of life unless somebody
steps up to take over maintenance. Please migrate to the 2020.02 series
instead which will be supported until April 2021.

- core: Fix compatibility with make 4.3+.
  Also fixup /lib references in libtool .la files, similar to how it is
  done for /usr/*.

- Toolchain: Fix kernel headers validation check for external toolchains.

- Security fixes for bluez5_utils, gnutls, gvfs, haproxy, hiredis,
  libical, libopenssl, libsndfile, ntp, php, pure-ftpd, tor

- Fixes for download/compilation/runtime/license issues in barebox-aux,
  busybox, civetweb, collectd, ffmpeg, gcc, kmscube, linux-tools, screen,
  util-linux, vala, vlc, xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.11

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02.10..

    15  Fabrice Fontaine
     7  Peter Korsgaard
     6  Bernd Kuhls
     5  Thomas Petazzoni
     4  Carlos Santos
     3  Yann E. MORIN
     2  Fabio Estevam
     2  S?bastien Szymanski
     1  Adam Duskett
     1  Anatoly Borodin
     1  James Hilliard
     1  J?rg Krause
     1  Merlin B?ge
     1  Naz?m Gediz AYDINDO?MU?
     1  Pascal de Bruijn
     1  Peter Seiderer
     1  Robert Hancock
     1  Stefan S?rensen
     1  Yaroslav Syrytsia

-- 
Bye, Peter Korsgaard
