From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 01:01:56 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120418230244.6694A96B10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e22dd64b32ff08eb71615be5a5ec6430ea77dc41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   48 ++++++++++++++++++++++++++++++++----------------
 1 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6ff4004..207cfe2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,27 +7,43 @@
 
 	CMake toolchain file moved to $HOST_DIR/usr/share/buildroot.
 
-	Defconfigs: mx53qsb, use 3.2.x for atngw100,
+	Apply-patches.sh: cleanups, archived patches handling fixes,
+	support series files.
 
-	Atom processor support.
+	Defconfigs: mx53qsb, use 3.2.x for atngw100, use 3.3.x for
+	qemu configs.
 
-	Toolchain: Add GCC 4.4.7, 4.6.3. 64bit fixes for external
+	Atom processor support. Microblaze architecture support (using
+	ext toolchain). Cleanup architecture names.
+
+	Toolchain: Add GCC 4.4.7, 4.6.3, 4.7.0. uClibc 0.9.33.1,
+	default to uClibc 0.9.33.x, 64bit fixes for external
 	toolchains, linaro ext toolchains, new sourcery codebench ext
 	toolchains.
 
-	Updated/fixed packages: alsa-lib, alsa-utils, atk, avahi,
-	barebox, bluez_utils, can-utils, ccache, dhcp, dnsmasq,
-	e2fsprogs, expat, feh, file, freetype, gamin, gmp, gpsd, grep,
-	gstreamer, gst-plugins-{bad,base,good,ugly}, hdparm,
-	imagemagick, kmod, libarchive, libcurl, libethumb, libffi,
-	libfuse, libglib2, libnl, libsoup, libxml2, libxslt,
-	linux-firmware, lite, lua, microperl, mpd, mpfr, mtd, nbd,
-	network-manager, ntfs-3g, openssl, pixman, qt, radvd, sdl_net,
-	smartmontools, squashfs3, squid, sysstat, tiff, usbutils,
-	util-linux, vala, wipe, xdriver_xf86-video-fbdev, zlib,
-
-	New packages: glib-networking, lcdprog, minicom, parted,
-	protobuf, zeromq
+	Updated/fixed packages: alsa-lib, alsa-utils, at, atk, avahi,
+	barebox, bind, bluez_utils, boost, can-utils, ccache,
+	coreutils, dhcp, directfb, dnsmasq, doom-wad, dosfstools,
+	e2fsprogs, expat, fakeroot, feh, ffmpeg, file, fis, freetype,
+	gamin, gawk, gdk-pixbuf, giblib, glib-networking, gmp, gnutls,
+	gpsd, grep, gstreamer, gst-plugins-{bad,base,good,ugly},
+	haserl, hdparm, imagemagick, iptable, iw, kmod, libarchive,
+	libatomic_ops, libconfig, libcurl, libedbus, libethumb,
+	libffi, libfuse, libglib2, libgtk2, libhid, libnl, libpng,
+	libsigc, libsoup, libupnp, liburcu, libxml2,
+	libxml-parser-perl, libxslt, linux-firmware, linux-fusion,
+	lite, ltrace, lttng-libust, lua, makedevs, microperl, mpd,
+	mpfr, mtd, mysql_client, nbd, neon, netsnmp, network-manager,
+	ntfs-3g, openssl, parted, pango, pcre, pixman, poco, psmisc,
+	pulseaudio, qt, radvd, rpm, samba, sam-ba, sawman, screen,
+	sdl_net, smartmontools, sqlite, squashfs3, squid, sshfs, sudo,
+	syslinux, sysstat, tftp-hpa, transmission, tiff, tinyhttpd,
+	udev, unionfs, usbutils, util-linux, vala, valgrind, vim,
+	vsftpd, wipe, xdriver_xf86-video-fbdev, xfsprogs, zlib,
+
+	New packages: apr, fmtools, glib-networking, hiawatha,
+	lcdprog, libcap-ng, libdmtx, libtpl, minicom, parted,
+	polarssl, protobuf, socketcand, systemd, ushare, zeromq
 
 	Deprecated packages: ttcp
 
