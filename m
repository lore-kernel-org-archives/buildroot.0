From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 21:23:18 +0200
Subject: [Buildroot] Buildroot 2020.02.6 released
Message-ID: <87tuwchvtl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.6 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.6.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.6.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.6 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.5 release. The 2020.02.x series is
supported until April 2021.

- Fix a 2020.02.5 build regression in busybox when systemd (and
  not less) are enabled because of missing infrastructure.

- Security fixes for cups, graphite2, imagemagick, mbedtls,
  python-django

- Fixes for download/compilation/runtime/license issues in alsa-utils,
  avahi, busybox, cups, docker-cli, paho-mqtt-c, systemd, uclibc,
  usb_modeswitch, wolfssl

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.6

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.5..

     7  Fabrice Fontaine
     4  Peter Korsgaard
     4  Yann E. MORIN
     3  Angelo Compagnucci
     2  Iulian Onofrei
     1  Arnout Vandecappelle (Essensium/Mind)
     1  John Keeping
     1  Julien Grossholtz
     1  Lukasz Tekieli
     1  Norbert Lange

-- 
Bye, Peter Korsgaard
