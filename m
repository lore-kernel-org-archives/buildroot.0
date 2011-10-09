From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Oct 2011 22:51:25 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20111009205135.6DB7E8E25C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b367d67afa9e3f3202355bf79665afe8ad0d5d43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   46 ++++++++++++++++++++++++++++++++--------------
 1 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2643641..70d4a79 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,25 +10,37 @@
 	menuconfig options.
 
 	Toolchain: Update external codesourcery toolchain download
-	URLs after Codesourcery got bought by Mentor. Fix uClibc
-	0.9.32 builds for e500 PPC.
+	URLs after Codesourcery got bought by Mentor, add x86
+	toolchain, update toolchain versions and optimize toolchain
+	sysroot copying. Fix uClibc 0.9.32 builds for e500 PPC,
+	updated GDB versions / download URLs. Binutils
+	libbfd/libopcodes static/dynamic linking fix.
+
+	Package infrastructure: Support for local packages /
+	overrides, package dir / name arguments dropped from
+	{GEN,AUTO,CMAKE}TARGETS.
 
 	Linux: Kernel extensions infrastructure support, Xenomai +
 	RTAI support.
 
 	Updated/fixed packages: acpid, busybox, dbus, dbus-glib,
-	directfb, dnsmasq, e2fsprogs, ethtool, fakeroot, fbdump,
-	freetype, fuse, gamin, gmp, jpeg, ipsec-tools, ipset,
-	iptables, iw, kexec, leafpad, libargtable2, libao, libconfuse,
-	libcuefile, libcurl, libevent, libreplaygain, libsamplerate,
-	libsndfile, libsoup, libsvgtiny, lighttpd, lzo, lzop, mpd,
-	mpfr, mpg123, musepack, mysql_client, netcat, netsnmp,
-	ntfs-3g, ntfsprogs, openssh, openssl, python, qt, radvd,
-	samba, sdl_sound, sqlite, squid, sylpheed, taglib, tar,
-	tcpreplay, tslib, usbutils, util-linux, valgrind, xterm
-
-	New packages: bluez-utils, cifs-utils, fluxbox, libev,
-	libftdi, libgeotiff, ngrep, openocd, portaudio, rtai, xenomai.
+	directfb, dnsmasq, drystone, e2fsprogs, ethtool, fakeroot,
+	fbdump, freetype, fuse, gamin, gmp, gnutls,
+	gst-plugins-{base,bad,good,ugly}, gstreamer, imagemagick,
+	ipsec-tools, ipset, iptables, iw, jpeg, kexec, leafpad, less,
+	libargtable2, libao, libconfuse, libcuefile, libcurl,
+	libevent, libglib2, libiconv, libreplaygain, libroxml,
+	libsamplerate, libsndfile, libsoup, libsvgtiny, libtool,
+	lighttpd, linux-fusion, lite, lsof, lzo, lzop, mcookie,
+	mpg123, mpd, mpfr, musepack, mysql_client, ncurses, netcat,
+	netsnmp, ntfs-3g, ntfsprogs, openssh, openssl, python, qt,
+	radvd, rsync, samba, sawman, sdl_sound, smartmontools, sqlite,
+	squid, sylpheed, taglib, tar, tcpreplay, tslib, usbutils,
+	util-linux, valgrind, whetstone, xdata_xcursor-themes, xterm
+
+	New packages: bluez-utils, cifs-utils, fftw, fluxbox, json-c,
+	libev, libftdi, libgeotiff, libplayer, ngrep, noip, openocd,
+	picocom, poco, portaudio, pv, rtai, xenomai.
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -42,6 +54,12 @@
 	#2917: Qt: Add declarative module
 	#3145: jffs2 image generation fails
 	#3271: netperf-2.4.5 fails to compile
+	#3331: xdata_xcursor-themes depends on xcursorgen
+	#3343: Add file:// download SITE_METHOD
+	#3391: Add support for specifying an external kernel tree
+	#3631: Error while compiling with Xorg
+	#3925: midori not getting compile
+	#4045: Add support for downloading i386 toolchains from codesourcery
 	#4183: Codesourcery toolchain download site has changed
 
 2011.08, Released August 31th, 2011:
