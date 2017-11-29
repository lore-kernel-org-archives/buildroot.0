From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 09:26:32 +0100
Subject: [Buildroot] Buildroot 2017.08.2 released
Message-ID: <87a7z5a3t3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.08.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.08.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.08.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.08.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2017.08.1 release.

- Security fixes for apr, apr-util, imagemagick, irssi, libcurl,
  libpjsip, libplist, openssh, openssl, postgresql, quagga, redis, ruby,
  samba4, sdl2, snmp++, webkitgtk, wget, wireshark

- Fixes for download/compilation/runtime issues in argp-standalone,
  collectd, dvb-apps, ffmpeg, go-bootstrap, google-breakpad, gstreamer,
  jimtcl, kvm-unit-test, libfastjson, libglib2, libidn, localedef,
  lttng-tools, luajit, mesa3d, moarvm, mp4v2, openssh, oracle-mysql,
  python3, qt, sdl2, swupdate, ti-gfx, uboot-tools, usb_modeswitch,
  vboot-utils, xapp_xdriinfo.

- Qt 5.6 series updated to 5.6.3

- Reproducible: Do not override SOURCE_DATE_EPOCH if already set
  in the environment.

- Makefiles: Workaround include order issues for certain make
  versions by explicitly sorting the result of wildcard where it
  matters.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.08.1..

    25  Peter Korsgaard
    12  Bernd Kuhls
     9  Thomas Petazzoni
     5  Adam Duskett
     4  Yann E. MORIN
     3  Baruch Siach
     3  Matt Weber
     3  Peter Seiderer
     2  Adrian Perez de Castro
     2  Andrey Smirnov
     2  Fabio Estevam
     1  Alex Suykov
     1  Andr? Hentschel
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Fabrice Fontaine
     1  Ga?l PORTAY
     1  Luca Ceresoli
     1  Maksim Salau
     1  Olivier Schonken
     1  Philippe Proulx
     1  Romain Naour
     1  Scott Ellis

-- 
Bye, Peter Korsgaard
