From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jul 2020 10:35:37 +0200
Subject: [Buildroot] Buildroot 2020.02.4 released
Message-ID: <87a6zmznae.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.4 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.4.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.4.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.4 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.3 release. The 2020.02.x series is
supported until April 2021.

- Toolchain:
  - Make external toolchain version check also work for toolchains
    configured with --with-gcc-major-version-only
  - Do not handle SOURCE_DATE_EPOCH in toolchain wrapper if the compiler
    supports it, fixing an issue with precompiled headers
  - Ensure debug libs from external toolchains are not installed into
    target if debugging is disabled

- Download:
  - Correct reproducibility issue in handling of git submodules for
    older git versions.
  - Fix file locking over NFS

- Per-package:
  - Fix an issue with python3 sysconfig data not getting correctly
    expanded
  - Fix per-package building for packages using the qmake infrastructure

- Br2-external: Fix error reporting for invalid br2-external trees

- Security fixes for asterisk, bind, clamav, dbus, docker-cli,
  docker-engine, freerdp, gnutls, go, gupnp, intel-microcode, libcurl,
  libglib2, libmicrohttpd, libvncserver, mbedtls, mongodb, mutt,
  nghttp2, ngircd, nodejs, ntp, pcre, php, putty, python-twisted,
  python-urllib3, python3, sqlite, squid, tcpreplay, tinydtls, upx, vlc,
  webkitgtk, wireshark, wpewebkit

- Fixes for download/compilation/runtime/license issues in cdrkit,
  checkpolicy, dbus, e2fsprogs, exim, exiv2, go, grub2,
  gst1-plugins-good, gst1-plugins-ugly, iproute2, irrlicht, iwd, jq,
  libcamera, libconfuse, libhttpserver, libopenssl, libxml2, libxmlrpc,
  lxc, mesa3d, meson, mtools, nodejs, open-plc-utils, openjdk-bin,
  openssh, oracle-mysql, paho-mqtt-c, php, prosody, python-validators,
  qt5xmlpatterns, redis, rpi-firmware, rtl8821au, samba4, sdl2, systemd,
  wireguard-linux-compat, wpebackend-fdo, zstd

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.4

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.3..

    34  Fabrice Fontaine
    16  Bernd Kuhls
    10  Peter Korsgaard
     6  Norbert Lange
     5  Adam Duskett
     5  Christian Stewart
     5  Matt Weber
     4  Baruch Siach
     4  Danomi Manchego
     4  Peter Seiderer
     4  Romain Naour
     4  Yann E. MORIN
     3  Adrian Perez de Castro
     3  Nicolas Robin
     3  Stefan S?rensen
     2  James Hilliard
     2  Martin Bark
     2  Sergio Prado
     2  Yegor Yefremov
     1  Aaron Sierra
     1  Alejandro Gonz?lez
     1  Alexandre Belloni
     1  Antoine Tenart
     1  Asaf Kahlon
     1  Bartosz Bilas
     1  Felix Vollmer
     1  Frank Hunleth
     1  John Keeping
     1  Joris Offouga
     1  Julien Olivain
     1  Lyle Franklin
     1  Maxim Cournoyer
     1  Myl?ne Josserand
     1  Nicolas Dufresne
     1  Sam Voss
     1  St?phane Veyret
     1  Thomas De Schampheleire
     1  Titouan Christophe
     1  Urja Rannikko
     1  Yi Zheng
     1  Yurii Monakov

-- 
Bye, Peter Korsgaard
