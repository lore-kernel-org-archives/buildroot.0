From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jul 2018 10:01:34 +0200
Subject: [Buildroot] Buildroot 2018.05.1 released
Message-ID: <87in5a8hep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2018.05.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2018.05.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2018.05.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2018.05.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2018.05 release.

- Security fixes for bind, clamav, file, gnupg, gnupg2, imagemagick, libcurl,
  libgcrypt, libressl, libvncserver, libvorbis, libxslt, mariadb,
  mpg123, nodejs, perl, qpdf, redis, wireshark

- Fixes for download/compilation/runtime issues in audit, btrfs-progs,
  cifs-utils, collectd, coreutils, docker-containerd, dos2unix,
  edid-decode, gcc, gdb, heimdal, hidapi, libglib2, liblogging,
  libostree, libsoup, libv4l, libwebsockets, lm-sensors, ncurses,
  patchelf, pinentry, pixiewps, php-amqp, qt53d, qt5charts, qt5scripts,
  systemd, triggerhappy, wireguard, wireless-regdb

- U-Boot: Ensure host version of ncurses is picked up and not
  host-ncurses built by buildroot, as that otherwise causes
  widechar/non-widechar conflicts and corrupted menuconfig menus.

- Linux: Enable CONFIG_PERF_EVENTS when perf is enabled.

- Toolchain: ARC tools updated to arc-2018.03.

- pkg-stats: Fix python 3.x compatibility.

- dl-wrapper: Fix support for URIs containing '+', fix no-check-hash for
  inferred site method.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2018.05..

    18  Baruch Siach
    11  Fabio Estevam
    10  Peter Korsgaard
     9  Fabrice Fontaine
     6  Bernd Kuhls
     5  Ga?l PORTAY
     4  Thomas Petazzoni
     2  Carlos Santos
     2  Evgeniy Didin
     2  Martin Bark
     2  Yann E. MORIN
     1  Asgeir Bjarni Ingvarsson
     1  Bryce Ferguson
     1  Christoph Engelbert
     1  Dan Walkes
     1  David De Grave (Essensium/Mind)
     1  David Owens
     1  Hollis Blanchard
     1  Jan Heylen
     1  Jason A. Donenfeld
     1  Joseph Kogut
     1  J?r?my Rosen
     1  Leon Anavi
     1  Marcus Folkesson
     1  Matt Weber
     1  Max Filippov
     1  Pierre-Louis Bossart
     1  Ricardo Martincoski
     1  Robert Beckett
     1  Romain Naour
     1  Sam Lancia
     1  S?bastien Szymanski

-- 
Bye, Peter Korsgaard
