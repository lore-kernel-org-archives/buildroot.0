From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 18:21:10 +0200
Subject: [Buildroot] Buildroot 2018.02.5 released
Message-ID: <87y3cp2lft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.5 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.5.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.5.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.5 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.4 release.

- Security fixes for apache, bind, dropbear, ipsec-tools, libarchive,
  libfuse, libopenssl, libsoup, mariadb, mbedtls, nodejs, openssh, php,
  postgresql, python-django, ruby, samba4, wireshark, wpa_supplicant,
  znc

- Fixes for download/compilation/runtime issues in acl, attr, brltty,
  bzip2, chrony, cryptsetup, eigen, erlang, ffmpeg, gcc, ghostscript,
  gnutls, libglib2, libselinux, lighttpd, linuxptp, lttng-modules,
  lttng-tools, lua-flu, lvm2, m4, makedevs, mesa3d-headers, mtd,
  ncurses, qt5xmlpatterns, shairport-sync, stress-ng, uboot-tools,
  uclibc, waylandpp, wireless_tools, xorriso

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.5

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.4..
    32  Bernd Kuhls
    15  Baruch Siach
    11  Peter Korsgaard
    11  Thomas Petazzoni
     8  Yann E. MORIN
     4  Fabrice Fontaine
     3  Julien BOIBESSOT
     3  Ricardo Martincoski
     2  Carlos Santos
     2  Fabio Estevam
     2  Francois Perrad
     2  Hollis Blanchard
     2  Marcin Niestroj
     2  Ryan Coe
     2  Stefan S?rensen
     2  Trent Piepho
     1  Adam Duskett
     1  Andr? Hentschel
     1  Angelo Compagnucci
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Christopher McCrory
     1  David Owens
     1  Geoff Levand
     1  Joel Stanley
     1  John Faith
     1  J?rg Krause
     1  Laurent Hartanerot
     1  Matt Flax
     1  S?bastien Szymanski
     1  Thomas Ehrhardt
     1  Vadim Kochan

-- 
Bye, Peter Korsgaard
