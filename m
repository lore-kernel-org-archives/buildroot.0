From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 20:57:19 +0100
Subject: [Buildroot] Buildroot 2020.02.11 released
Message-ID: <871rde31sw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.11 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.11.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.11.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.11 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.10 release. The 2020.02.x series is
supported until April 2021.

- meson: Fix ccache detection handling when per-package builds are used.

- Fakeroot: Fix compatibility issue with glibc 2.33

- Security fixes for atftp, cereal, connman, dnsmasq, docker-engine,
  intel-microcode, jasper, libopenssl, php, postgresql, privoxy,
  python-bottle, python-django, python3, sox, subversion,
  wpa_supplicant, xterm

- Fixes for download/compilation/runtime/license issues in busybox,
  dhcpcd, docker-cli, fakeroot, intel-mediadriver,
  kodi-inputstream-adaptive, libbsd, libopenssl, linux-headers,
  mosquitto, orc, pugixml, rauc, tzdata, wireguard-linux-compat, xenomai

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.11

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.10..

    20  Peter Korsgaard
    13  Fabrice Fontaine
     4  Bernd Kuhls
     3  Petr Vorel
     3  Thomas Petazzoni
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Baruch Siach
     2  Michael Vetter
     2  Romain Naour
     2  Yann E. MORIN
     1  Bartosz Bilas
     1  James Hilliard
     1  J?rg Krause
     1  Nicolas Cavallari
     1  Peter Seiderer
     1  Samuel Mendoza-Jonas
     1  Sergio Prado
     1  Yann Sionneau

-- 
Bye, Peter Korsgaard
