From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 16:50:42 +0200
Subject: [Buildroot] Buildroot 2018.05.2 released
Message-ID: <875zzu5yv1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.05.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.05.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.05.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.05.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.05.1 release.

- Security fixes for apache, bind, dropbear, ipsec-tools, libarchive,
  libfuse, libopenssl, libsoup, mariadb, mbedtls, nodejs, openssh, php,
  python-django, ruby, samba4, wireshark, wpa_supplicant, znc

- Fixes for download/compilation/runtime issues in acl, attr, brltty,
  bzip2, chrony, cryptsetup, eigen, ffmpeg, gcc, ghostscript, gnutls,
  imx-gpu-viv, libglib2, libselinux, lighttpd, linuxptp, lttng-modules,
  lttng-tools, lua-flu, lvm2, m4, makedevs, mesa3d-headers, mtd,
  ncurses, rauc, stress-ng, uboot-tools, uclibc, waylandpp,
  wireless_tools, wireless-regdb, xorriso

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.05.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.05.1..

    27  Bernd Kuhls
    12  Baruch Siach
    11  Peter Korsgaard
    11  Thomas Petazzoni
     8  Yann E. MORIN
     3  Hollis Blanchard
     3  Ricardo Martincoski
     2  Carlos Santos
     2  Fabio Estevam
     2  Julien BOIBESSOT
     2  Laurent Hartanerot
     2  Marcin Niestroj
     2  Ryan Coe
     2  Trent Piepho
     1  Alexey Brodkin
     1  Andr? Hentschel
     1  Angelo Compagnucci
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Christopher McCrory
     1  David Owens
     1  Fabrice Fontaine
     1  Geoff Levand
     1  Joel Stanley
     1  John Faith
     1  Matt Flax
     1  Thomas Ehrhardt
     1  Vadim Kochan

-- 
Bye, Peter Korsgaard
