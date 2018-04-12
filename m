From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Apr 2018 18:03:00 +0200
Subject: [Buildroot] Buildroot 2017.02.11 released
Message-ID: <87a7u8za2z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2017.02.11 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2017.02.11.tar.gz

or

http://buildroot.org/downloads/buildroot-2017.02.11.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2017.02.11 is the 11th bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2017.02.10 release.

- Dependencies: Blacklist tar 1.30+ and build our own host-tar
  if needed as tar 1.30+ changed the --numeric-owner output for
  long path names. Build host-tar before other host-dependencies
  as they need it to extract their source tarballs.

- Security fixes for apache, busybox, clamav, dnsmasq, dovecot, exim,
  imagemagick, irssi, libcurl, libpjsip, librsvg, libtasn1, libvorbis,
  libxml2, mariadb, mbedtls, ntp, mosquitto, openssl, patch, postgresql,
  python-webpy, quagga, rsync, samba4, tremor, wavpack, wireshark,
  xerces

- Fixes for download/compilation/runtime issues in busybox, dhcp,
  dnsmasq, jq, lz4, ntp, openblas, opencv3, python-webpy, qt53d,
  qt5tools, sngrep, xterm

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2017.02.11

Users of the affected packages are strongly encouraged to upgrade.

Notice that the 2017.02 series is now end of life. No more updates are
planned as 2018.02 is the new long term support release. Please consider
migrating to the 2018.02 series!

Many thanks to all the people contributing to this release:

git shortlog -sn 2017.02.10..

    26  Peter Korsgaard
    17  Baruch Siach
    13  Fabio Estevam
     8  Adam Duskett
     8  Bernd Kuhls
     2  Ga?l PORTAY
     2  Thomas Petazzoni
     1  Andr? Hentschel
     1  Jeroen Roovers
     1  Peter Seiderer
     1  Ryan Coe
     1  Samuel Martin
     1  Sasha Shyrokov
     1  Thomas De Schampheleire
     1  Valentin Korenblit
     1  Vicente Olivert Riera

-- 
Bye, Peter Korsgaard
