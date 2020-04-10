From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Apr 2020 10:14:12 +0200
Subject: [Buildroot] Buildroot 2019.11.3 released, 2019.11.x is EOL
Message-ID: <87r1wvg3l7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.11.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.11.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.11.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.11.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2019.11.2 release.

- core: Fix compatibility with make 4.3+.
  Also fixup /lib references in libtool .la files, similar to how it is
  done for /usr/*.

- Toolchain: Fix kernel headers validation check for external toolchains.

- Security fixes for bluez5_utils, gnutls, gvfs, haproxy, hiredis,
  hostapd, libical, libopenssl, libsndfile, ntp, php, pure-ftpd, redis,
  tor, wpa_supplicant

- Fixes for download/compilation/runtime/license issues in barebox-aux,
  busybox, civetweb, cog, collectd, ffmpeg, gcc, gssdp, kmscube,
  linux-tools, llvm, radvd, samba4, screen, syslinux, syslog-ng, uacme,
  util-linux, vala, vlc, xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.11.3

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2019.11.x series is now end of life. Please migrate to
the 2020.02.x series instead which will be supported until April 2021.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.11.2..

    16  Fabrice Fontaine
     6  Peter Korsgaard
     3  Carlos Santos
     3  Thomas Petazzoni
     3  Yann E. MORIN
     2  Adam Duskett
     2  Fabio Estevam
     2  James Hilliard
     2  Romain Naour
     2  S?bastien Szymanski
     1  Alexander Dahl
     1  Alexander Mukhin
     1  Anatoly Borodin
     1  Baruch Siach
     1  Bernd Kuhls
     1  Joseph Kogut
     1  J?rg Krause
     1  Merlin B?ge
     1  Naz?m Gediz AYDINDO?MU?
     1  Pascal de Bruijn
     1  Peter Seiderer
     1  Robert Hancock
     1  Stefan S?rensen
     1  Thomas De Schampheleire
     1  Titouan Christophe
     1  Yaroslav Syrytsia

-- 
Bye, Peter Korsgaard
