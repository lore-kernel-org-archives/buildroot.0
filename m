From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 12:21:53 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120425102210.6DB7196BB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf636a9463d6620ecfaed882c2938aa77a7b6542
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   49 +++++++++++++++++++++++++++++--------------------
 1 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/CHANGES b/CHANGES
index 207cfe2..0221727 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,36 +14,44 @@
 	qemu configs.
 
 	Atom processor support. Microblaze architecture support (using
-	ext toolchain). Cleanup architecture names.
+	ext toolchain). Cleanup architecture names, deprecate Xtensa
+	support.
 
 	Toolchain: Add GCC 4.4.7, 4.6.3, 4.7.0. uClibc 0.9.33.1,
 	default to uClibc 0.9.33.x, 64bit fixes for external
 	toolchains, linaro ext toolchains, new sourcery codebench ext
 	toolchains.
 
+	Bootloaders: U-Boot: add 2012.04. Barebox: add 2012.04, remove
+	2011.12.
+
 	Updated/fixed packages: alsa-lib, alsa-utils, at, atk, avahi,
 	barebox, bind, bluez_utils, boost, can-utils, ccache,
-	coreutils, dhcp, directfb, dnsmasq, doom-wad, dosfstools,
-	e2fsprogs, expat, fakeroot, feh, ffmpeg, file, fis, freetype,
-	gamin, gawk, gdk-pixbuf, giblib, glib-networking, gmp, gnutls,
-	gpsd, grep, gstreamer, gst-plugins-{bad,base,good,ugly},
-	haserl, hdparm, imagemagick, iptable, iw, kmod, libarchive,
-	libatomic_ops, libconfig, libcurl, libedbus, libethumb,
-	libffi, libfuse, libglib2, libgtk2, libhid, libnl, libpng,
-	libsigc, libsoup, libupnp, liburcu, libxml2,
+	coreutils, dbus, dhcp, directfb, dnsmasq, doom-wad,
+	dosfstools, e2fsprogs, expat, fakeroot, feh, ffmpeg, file,
+	fis, freetype, gamin, gawk, gdk-pixbuf, giblib,
+	glib-networking, gmp, gnutls, gpsd, grep, gstreamer,
+	gst-plugins-{bad,base,good,ugly}, haserl, hdparm, imagemagick,
+	iptable, iw, kexec, kmod, lame, libarchive, libatomic_ops,
+	libconfig, libcurl, libedbus, libethumb, libffi, libfuse,
+	libglib2, libgtk2, libhid, libmpeg2, libnl, libpng, libsigc,
+	libsoup, libupnp, liburcu, libusb, libusb-compat, libxml2,
 	libxml-parser-perl, libxslt, linux-firmware, linux-fusion,
 	lite, ltrace, lttng-libust, lua, makedevs, microperl, mpd,
-	mpfr, mtd, mysql_client, nbd, neon, netsnmp, network-manager,
-	ntfs-3g, openssl, parted, pango, pcre, pixman, poco, psmisc,
-	pulseaudio, qt, radvd, rpm, samba, sam-ba, sawman, screen,
-	sdl_net, smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
-	syslinux, sysstat, tftp-hpa, transmission, tiff, tinyhttpd,
-	udev, unionfs, usbutils, util-linux, vala, valgrind, vim,
-	vsftpd, wipe, xdriver_xf86-video-fbdev, xfsprogs, zlib,
-
-	New packages: apr, fmtools, glib-networking, hiawatha,
-	lcdprog, libcap-ng, libdmtx, libtpl, minicom, parted,
-	polarssl, protobuf, socketcand, systemd, ushare, zeromq
+	mpfr, mpg123, mtd, mysql_client, nbd, neon, netsnmp,
+	network-manager, ntfs-3g, openssl, parted, pango, pcre,
+	pixman, poco, psmisc, pulseaudio, python, qt, radvd, rpm,
+	samba, sam-ba, sane-backends, sawman, screen, sdl_net,
+	smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
+	syslinux, sysstat, taglib, tftp-hpa, transmission, tiff,
+	tinyhttpd, udev, unionfs, usbutils, util-linux, vala,
+	valgrind, vim, vsftpd, wipe, xdriver_xf86-video-fbdev,
+	xfsprogs, zlib,
+
+	New packages: apr, audiofile, fmtools, glib-networking,
+	hiawatha, latencytop, lcdproc, libcap-ng, libdmtx, libtpl,
+	minicom, parted, polarssl, protobuf, socketcand, systemd,
+	ushare, zeromq
 
 	Deprecated packages: ttcp
 
@@ -51,6 +59,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#2353: [lua] fix build with 2010.08-rc1
 	#4880: New package lcdproc
 	#4886: New package protobuf
 
