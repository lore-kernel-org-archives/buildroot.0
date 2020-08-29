From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 21:51:03 +0200
Subject: [Buildroot] Buildroot 2020.02.5 released
Message-ID: <87mu2ddye0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.5 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.5.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.5.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.5 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.4 release. The 2020.02.x series is
supported until April 2021.

- Infrastructure: Ensure RPATH entries that may be needed for dlopen()
  are not dropped by patchelf.

  BR_VERSION_FULL/setlocalversion (used by make print-version
  and /etc/os-release): Properly handle local git tags

- Security fixes for apache, bind, chrony, dovecot, dropbear, gd,
  gdk-pixbuf, ghostscript, glibc, grub2, hostapd, jasper, json-c,
  libcurl, mosquitto, openjpeg, perl, postgresql, python-django, ruby,
  shadowsocks-libev, squid, trousers, webkitgtk, wireshark, wolfssl,
  wpewebkit, xen, xlib_libX11, xserver_xorg-server

- Fixes for download/compilation/runtime/license issues in
  at91bootstrap3, boost, busybox, capnproto, collectd, cpio, cups, cvs,
  dbus, docker-engine, domoticz, dovecot-pigeonhole, efl, elixir,
  f2fs-tools, ffmpeg, gst1-plugins-bad, iputils, libcurl, libwebsockets,
  linux, live555, mesa3d, mosquitto, mpv, nodejs, opencv, opencv3,
  patchelf, php, postgresql, python-gunicorn, python-matplotlib,
  ripgrep, rtl8188eu, rtl8821au, tpm2-abrmd, tpm2-tools, uacme,
  wpa_supplicant

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.5

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.4..

    26  Fabrice Fontaine
    21  Thomas Petazzoni
    20  Peter Korsgaard
    12  Bernd Kuhls
    11  Heiko Thiery
     5  Nicola Di Lieto
     4  Angelo Compagnucci
     4  Titouan Christophe
     3  Francois Perrad
     2  Adrian Perez de Castro
     2  Brandon Maier
     2  James Hilliard
     2  Michael Nosthoff
     2  Norbert Lange
     2  Peter Seiderer
     2  Yann E. MORIN
     1  Adam Duskett
     1  Baruch Siach
     1  Christian Stewart
     1  Christopher Pelloux
     1  Eugen Hristev
     1  Frank Vanbever
     1  Gregory CLEMENT
     1  John Keeping
     1  Michael Vetter
     1  Paul Cercueil
     1  Romain Naour
     1  Sam Voss
     1  Sergey Matyukevich
     1  Sergio Prado
     1  Stefan S?rensen
     1  Thomas De Schampheleire
     1  Yann Sionneau

-- 
Bye, Peter Korsgaard
