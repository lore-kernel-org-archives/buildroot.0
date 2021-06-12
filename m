From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 12 Jun 2021 23:33:38 +0200
Subject: [Buildroot] Buildroot 2021.02.3 released
Message-ID: <87a6nuepjh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2021.02.3 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2021.02.3.tar.gz

or

http://buildroot.org/downloads/buildroot-2021.02.3.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2021.02.2 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2021.02.2 release.

- CPE meta data has been added for a large number of packages

- Security fixes for apache, bitcoin, connman, dhcp, expat, go,
  gptfdisk, gupnp, hostapd, imagemagick, intel-microcode,
  jquery-validation, libcurl, libxml2, live555, lz4, mpv, mutt, nginx,
  openssh, paho-mqtt-c, postgresql, prosody, python-pillow, redis, runc,
  squid, vlc, wireshark, xlib_libX11, xterm,

- Fixes for download/compilation/runtime/license issues in assimp,
  boost, capnproto, dc3dd, dhcp, directfb, dmalloc, docker-engine,
  ebtables, environment-setup, flatcc, gdb, hostapd, hwloc, iftop,
  imx-gpu-viv, intel-mediadriver, libcamera, libcutl, libesmtp, libgeos,
  libkcapi, libopenh264, libraw, libtirpc, libxslt, llvm, lmbench,
  localedef, lttng, lvm2, mimic, mono-gtksharp3, mpg123, netperf, odb,
  opentyrian, pifmrds, python-bluezero, python-pillow, qemu, qt5base,
  rt-tests, strace, uclibc, uhd, vlc, waylandpp, webkitgtk,
  wpa_supplicant, wpewebkit

- CPE metadata for bird, acpid, apcupsd, blktrace, chrony,
  enlightenment, enscript, exempi, findutils, fluidsynth, frr, grpe,
  gst1-plugins-bad, gst1-rtsp-server, gstreamer1, i2c-tools,
  jquery-validation, keepalived, kodi, less, libeXosip2, libfuse,
  libfuse3, libgtk2, libgtk3, libical, libidn, libidn2, libldns, libmms,
  libmodbus, libmspack, libnids, liboping, librelp, libsamplerate,
  libusb, libuv, libxcb, lvm2, mesa3d, mini-snmpd, minidlna, minissdpd,
  minizip, mpv, msmtp, musl, nasm, nbd, netsurf, opencv3, oprofile,
  p7zip, perl, php-imagick, picocom, pigz, pngquant, poco,
  proxychains-ng, pulseaudio, pwgen, python-autobahn, python-engineio,
  python-keyring, python-requests, python-tqdm, qpdf, refpolicy,
  shellinabox, supervisor, synergy, taglib, tclap, terminology,
  thermald, tini, tinyproxy, tinyxml2, tpm2-tss, uclibc, udisks, weston,
  xlib_libFS, xlib_libdmx, xlib_libICE, xlib_libXcursor, xlib_libXdmcp,
  xlib_libXext, xlib_libXfixes, xlib_libXfont2, xlib_libXinerama,
  xlib_libXpm, xlib_libXres, xlib_libXt, xlib_libXtst, xlib_libXxf86dga,
  xlib_libXxf86vm,

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2021.02.3

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2021.02.2..

   152  Fabrice Fontaine
    17  Peter Korsgaard
    11  Bernd Kuhls
     5  Yann E. MORIN
     4  Adrian Perez de Castro
     4  Heiko Thiery
     3  Arnout Vandecappelle (Essensium/Mind)
     3  Sergey Matyukevich
     2  Baruch Siach
     2  Peter Seiderer
     2  Romain Naour
     2  Vineet Gupta
     1  Alexander Dahl
     1  Christian Stewart
     1  Dick Olsson
     1  Grzegorz Blach
     1  John Keeping
     1  Matthew Weber
     1  Mircea GLIGA
     1  Norbert Lange
     1  Petr Vorel
     1  Sam Voss
     1  Thomas De Schampheleire
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
