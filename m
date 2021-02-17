From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 19:40:02 +0100
Subject: [Buildroot] Buildroot 2020.11.3 released
Message-ID: <875z2q35dp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.11.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.11.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.11.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.11.3 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.11.2 release.

- meson: Fix ccache detection handling when per-package builds are used.

- Fakeroot: Fix compatibility issue with glibc 2.33

- Security fixes for atftp, cereal, chartjs, connman, dnsmasq,
  docker-engine, go, intel-microcode, jasper, libopenssl, php,
  postgresql, privoxy, python-bottle, python-django, python3, sox,
  subversion, webkitgtk, wireshark, wpa_supplicant, xterm

- Fixes for download/compilation/runtime/license issues in binutils,
  busybox, dhcpcd, docker-cli, ebtables, fakeroot, flashrom, go,
  gst1-python, guile, intel-mediadriver, kodi-inputstream-adaptive,
  lcms2, libbsd, libopenssl, linux-headers, makedumpfile, memtester,
  mosquitto, ne10, openblas, orc, pugixml, rauc, tzdata, uboot-tools,
  uclibc, wireguard-linux-compat, wpewebkit, xenomai,
  xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.11.2..

    23  Peter Korsgaard
    19  Fabrice Fontaine
     5  Thomas De Schampheleire
     4  Bernd Kuhls
     4  Thomas Petazzoni
     2  Baruch Siach
     2  Michael Vetter
     2  Romain Naour
     2  Yann E. MORIN
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Bartosz Bilas
     1  Christian Stewart
     1  Geoffrey Le Gourri?rec
     1  Joeri Barbarien
     1  J?rg Krause
     1  Nicolas Cavallari
     1  Peter Seiderer
     1  Samuel Mendoza-Jonas
     1  Yann Sionneau

-- 
Bye, Peter Korsgaard
