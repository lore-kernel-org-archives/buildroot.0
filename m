From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Jun 2020 17:14:24 +0200
Subject: [Buildroot] Buildroot 2020.02.3 released
Message-ID: <87zh9kb2r3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.3 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.2 release. The 2020.02.x series is
supported until April 2021.

- Fix various build issues of host packages on hosts using GCC 10

- Security fixes for bind, clamav, dovecot, freerdp, git,
  glib-networking, libexif, lrzip, mariadb, mp4v2, openldap, php,
  wireshark, xen

- Fixes for download/compilation/runtime/license issues in
  arm-trusted-firmware, audit, binutils, bison, crda, dtc, elf2flt, efl,
  erlang, fakeroot, ffmpeg, fmc, fmlib, gcc, gnupg, leveldb,
  libusb-compat, linux-headers, ltrace, mesa3d, openocd, perl, prosody,
  python-pyqt5, rpi-firmware, qemu, rustc, speexdsp, sysrepo, systemd,
  tremor, vboot-utils,

- Remove python-pycrypto (unmaintained, security issues, consider
  python-pycryptodomex instead)

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.2..

    15  Fabrice Fontaine
     7  Romain Naour
     7  Thomas Petazzoni
     6  Heiko Thiery
     5  Peter Korsgaard
     5  Yann E. MORIN
     3  Bernd Kuhls
     2  James Hilliard
     1  Carlos Santos
     1  Danomi Manchego
     1  Fabio Estevam
     1  Francois Perrad
     1  Joachim Nilsson
     1  Joseph Kogut
     1  Julien Olivain
     1  J?r?my Rosen
     1  Lecopzer Chen
     1  Matt Weber
     1  Max Filippov
     1  Norbert Lange
     1  Peter Seiderer
     1  Ryan Coe
     1  Stefan S?rensen
     1  Stephan Hoffmann

-- 
Bye, Peter Korsgaard
