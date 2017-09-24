From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 22:43:22 +0200
Subject: [Buildroot] Buildroot 2017.02.6 released
Message-ID: <87zi9jketx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.6 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.6.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.6.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.6 is the 6th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.5 release.

- Security fixes for apache, bluez5_utils, botan, connman, faad2,
  ffmpeg, file, gd, gdk-pixbuf, git, gnupg, imagemagick, libarchive,
  libcurl, libgcrypt, libidn, librsync, librsvg, libsoup, libxml2,
  mariadb, mbedtls, openjpeg, postgresql, proxychains-ng, ruby, samba4,
  strongswan, subversion, supervisor, tcpdump, tor, unrar, xen

- Fixes for download/compilation/runtime issues in bcusdk, bind,
  binutils, cmake, dbus, dialog, e2fsprogs, faad2, fakeroot, flashrom,
  gcc, gdb, gpsd, grub2, gst1-plugins-bad, iostat, iucode-tool, jack2,
  libphidget, librsync, linux-tools, lua, mediastreamer, minidlna,
  netplug, nss-pam-ldapd, nvidia-driver, python-libconfig,
  python-service-identity, qt, rpcbind, samba4, squashfs, squid,
  sysvinit, transmission, webkitgtk, whois, zmqpp

- Cmake: Ensure correct pkg-config is used when building host packages

- fs/iso9660: Ensure files from earlier builds are not included

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.6

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.6..

    29  Peter Korsgaard
    28  Bernd Kuhls
    16  Baruch Siach
    10  Thomas Petazzoni
     5  Yann E. MORIN
     4  Adam Duskett
     4  Adri?n P?rez de Castro
     4  Andrey Smirnov
     3  Gustavo Zacarias
     3  Max Filippov
     3  Vicente Olivert Riera
     2  Fabio Estevam
     2  Marcus Hoffmann
     2  Olivier Schonken
     2  Peter Seiderer
     2  Ryan Coe
     1  Arnout Vandecappelle
     1  Charles Hardin
     1  Dagg Stompler
     1  Erico Nunes
     1  Julien Corjon
     1  J?rg Krause
     1  Kurt Van Dijck
     1  Luca Ceresoli
     1  Martin Bark
     1  Naoki Matsumoto
     1  Petr Kulhavy
     1  Samuel Martin
     1  Waldemar Brodkorb
     1  Yegor Yefremov

-- 
Bye, Peter Korsgaard
