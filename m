From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 May 2018 19:10:51 +0200
Subject: [Buildroot] Buildroot 2018.02.2 released
Message-ID: <877eojwdlw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.02.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.02.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.02.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.02.2 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2018.02.1 release.

- Infrastructure: Tweak package size/file instrumentation to better
  handle package rebuilds.

- Revert /etc/shells creation when bash is enabled as it doesn't handle
  the standard shells.

- Exclude /lib/firmware from the rpath fixup logic, as it may contain
  non-native ELF files.

- Scanpypi: Support the new PyPi infrastructure.

- Handle GCC 8.x on the host.

- Ensure timestamp of /usr is updated to support the systemd
  ConditionNeedsUpdate option.

- Security fixes for gnupg2, mbedtls, php, sdl2_image

- Fixes for download/compilation/runtime issues in bluez5_utils, flann,
  gdb, grub2, libcec, libtomcrypt, python, python-requests,
  python-watchdog, qt53d, qt5websockets, syslog-ng, systemd, uclibc,
  usb_modeswitch, wireguard, wmctrl

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2018.02.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.02.1..

     9  Baruch Siach
     7  Fabio Estevam
     5  Romain Naour
     5  Thomas Petazzoni
     4  Bernd Kuhls
     4  Peter Korsgaard
     3  Stefan Becker
     3  Yegor Yefremov
     2  Fabrice Fontaine
     1  Anssi Hannula
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Chris Lesiak
     1  Eric Le Bihan
     1  Jason A. Donenfeld
     1  John Keeping
     1  Jonas Zaddach
     1  Manfred Schlaegl
     1  Ricardo Martincoski
     1  Romain Reignier
     1  Sven Haardiek
     1  Tarek El-Sherbiny

Bye, Peter Korsgaard
