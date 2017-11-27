From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Nov 2017 00:14:44 +0100
Subject: [Buildroot] Buildroot 2017.02.8 released
Message-ID: <87efoj9uvv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.8 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.8.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.8.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.8 is the 8th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.7 release.

- Security fixes for apr, apr-util, imagemagick, libpjsip, libplist,
  openssl, postgresql, quagga, ruby, samba4, snmp++, webkitgtk,
  wireshark

- Fixes for download/compilation/runtime issues in argp-standalone,
  collectd, dvb-apps, ffmpeg, google-breakpad, gstreamer, libfastjson,
  libglib2, localedef, mesa3d, openssh, python3, vboot-utils,
  xapp_xdriinfo.

- Qt 5.6 series updated to 5.6.3

- Reproducible: Do not override SOURCE_DATE_EPOCH if already set
  in the environment.

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.8

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.7..

    11  Bernd Kuhls
    10  Peter Korsgaard
     5  Adam Duskett
     4  Yann E. MORIN
     2  Baruch Siach
     2  Fabio Estevam
     2  Matt Weber
     2  Peter Seiderer
     2  Thomas Petazzoni
     1  Adrian Perez de Castro
     1  Alex Suykov
     1  Andrey Smirnov
     1  Andr? Hentschel
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Fabrice Fontaine
     1  Ga?l PORTAY
     1  Luca Ceresoli
     1  Romain Naour
     1  Scott Ellis
     1  Vicente Olivert Riera

-- 
Bye, Peter Korsgaard
