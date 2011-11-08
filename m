From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 00:33:13 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20111108233329.B6F92805FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=805de39555682475e3738cca1c3b6a70257ba0aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   35 ++++++++++++++++++++++-------------
 1 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0043126..2c4c161 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,6 +5,12 @@
 	Move misc scripts and support stuff to support/. Rename
 	patch-kernel.sh to support/scripts/apply-patches.sh.
 
+	Documentation: Moved to asciidoc format, make targets to
+	generate text/html/pdf/epub output added.
+
+	Defconfigs: Qemu configs updated to 3.1 kernel and readmes
+	added.
+
 	Bootloaders: Add support for custom git tree / tarballs for
 	barebox, similar to how it's handled for u-boot. Clean up
 	menuconfig options.
@@ -14,7 +20,8 @@
 	toolchain, update toolchain versions and optimize toolchain
 	sysroot copying. Fix uClibc 0.9.32 builds for e500 PPC,
 	updated GDB versions / download URLs. Binutils
-	libbfd/libopcodes static/dynamic linking fix.
+	libbfd/libopcodes static/dynamic linking fix. GCC 4.6.2 added,
+	use ctng-1.13.0.
 
 	Package infrastructure: Support for local packages /
 	overrides, package dir / name arguments dropped from
@@ -32,20 +39,22 @@
 	libconfuse, libcuefile, libcurl, libdaemon, libevent,
 	libglib2, libiconv, libmpd, libreplaygain, libroxml,
 	libsamplerate, libsndfile, libsoup, libsvgtiny, libtool,
-	lighttpd, links, linux-fusion, lite, lrzsz, lsof, lzo, lzop,
-	makedevs, mcookie, mpg123, mpd, mpfr, mtd, musepack, mutt,
-	mysql_client, ncftp, ncurses, neon, netcat, netsnmp, ntfs-3g,
-	ntfsprogs, ntp, openntpd, openssh, openssl, orc, pciutils,
-	psmisc, python, qt, quagga, radvd, rpm, rsync, samba, sawman,
-	sdl_sound, smartmontools, sqlite, squid, stunnel, sudo,
-	sylpheed, sysstat, taglib, tar, tcpreplay, tslib, usbutils,
-	util-linux, valgrind, wget, whetstone, which, wpa-supplicant,
-	xdata_xcursor-themes, xmlstarlet, xterm
+	libxcb, lighttpd, links, linux-fusion, lite, lrzsz, lsof, lzo,
+	lzop, makedevs, mcookie, mpg123, mpd, mpfr, mtd, musepack,
+	mutt, mysql_client, ncftp, ncurses, neon, netcat, netsnmp,
+	ntfs-3g, ntfsprogs, ntp, openntpd, openssh, openssl, oprofile,
+	orc, pciutils, psmisc, python, qt, quagga, radvd, rpm, rsync,
+	samba, sawman, sdl_sound, smartmontools, sqlite, squid,
+	stunnel, sudo, sylpheed, sysstat, taglib, tar, tcpreplay,
+	tslib, usbutils, util-linux, valgrind, wget, whetstone, which,
+	wpa-supplicant, xdata_xcursor-themes, xmlstarlet, xterm
 
 	New packages: bluez-utils, cifs-utils, fftw, fluxbox, json-c,
-	libev, libftdi, libgeotiff, libplayer, ngrep, noip, opencv,
-	openocd, picocom, poco, portaudio, pulseaudio, pv, rtai, vala,
-	xenomai.
+	libev, libftdi, libgeotiff, libmodbus, libplayer, live555,
+	ngrep, noip, opencv, openocd, picocom, poco, portaudio,
+	pulseaudio, pv, rtai, vala, xenomai.
+
+	Removed packages: liboil, sfdisk, swfdec, webif
 
 	Issues resolved (http://bugs.uclibc.org):
 
