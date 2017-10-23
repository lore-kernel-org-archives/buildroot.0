From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 00:07:00 +0200
Subject: [Buildroot] Buildroot 2017.08.1 released
Message-ID: <87mv4h7c3f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.08.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.08.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.08.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.08.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2017.08 release.

- Security fixes for apache, augeas, bluez5_utils, dnsmasq, ffmpeg,
  file, gd, gdk-pixbuf, git, hostapd, imagemagick, iucode-tool, lame,
  libarchive, libcurl, libidn, libnss, librsync, libsoup, libxml2,
  libzip, mbedtls, musl, openvpn, proxychains-ng, qemu, ruby, samba4,
  sqlite, strongswan, subversion, supervisor, tcpdump, tor, unrar,
  webkitgtk, wpa_supplicant, xen, xlib_libXfont, xlib_libXfont2,
  xserver_xorg-server

- Fixes for download/compilation/runtime issues in bind, busybox, bzip2,
  cmake, ejabberd, flashrom, go, ifupdown-scripts,
  kernel-module-imx-gpu-viv, libffi, libmbim, libressl, netplug, nginx,
  poppler, qt, rpi-userland, rsyslog, softether, supertuxkart, urg,
  vboot-utils, xmlstarlet, zsh

- Webkitgtk bumped to the 2.18.x series, fixing a large number of
  security issues.

- Defconfigs: galileo: fix ext4 related kernel config, bump kernel for
  gcc 6.x compatibility, enable wchar support for grub2. wandboard:
  correct rootfs offset

- support: Ensure gzip compression level 6 is used for git tarballs.
  check-bin-arch: Correctly handle (ignore) symbolic links.
  check-rpath: Also handle PIE binaries

- External toolchain: Correctly handle glibc Buildroot toolchains built
  with merged /usr

- musl: fix ARMv4 build with binutils 2.27.51+, fix for CVE-2017-15650

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.08..

    31  Bernd Kuhls
    29  Peter Korsgaard
    12  Baruch Siach
     4  Nicholas Sielicki
     3  Alexander Mukhin
     3  Cam Hutchison
     3  Thomas Petazzoni
     2  Adam Duskett
     2  Adrian Perez de Castro
     2  Alfredo Alvarez Fernandez
     2  Angelo Compagnucci
     2  Fabio Estevam
     2  Luca Ceresoli
     2  Petr Kulhavy
     2  Romain Naour
     2  Thomas Claveirole
     2  Yann E. MORIN
     1  Aleksander Morgado
     1  Alex Suykov
     1  Carlos Santos
     1  Evgeniy Didin
     1  Gary Bisson
     1  Johan Oudinet
     1  Julien Corjon
     1  J?rg Krause
     1  Lothar Felten
     1  Matt Weber
     1  Mauro Condarelli
     1  Max Filippov
     1  Thomas De Schampheleire
     1  Timothy Lee

-- 
Bye, Peter Korsgaard
