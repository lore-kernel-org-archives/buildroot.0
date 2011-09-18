From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Sep 2011 23:01:33 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110918210217.4F0F58D5CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=358601f851c001fc9505efb4866436afc030a170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   44 ++++++++++++++++++++++++++++++++++----------
 1 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5a44e72..0453749 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,22 +2,46 @@
 
 	Fixes all over the tree and new features.
 
-	Update external codesourcery toolchain download URLs after
-	Codesourcery got bought by Mentor.
+	Move misc scripts and support stuff to support/. Rename
+	patch-kernel.sh to support/scripts/apply-patches.sh.
+
+	Bootloaders: Add support for custom git tree / tarballs for
+	barebox, similar to how it's handled for u-boot. Clean up
+	menuconfig options.
+
+	Toolchain: Update external codesourcery toolchain download
+	URLs after Codesourcery got bought by Mentor. Fix uClibc
+	0.9.32 builds for e500 PPC.
+
+	Linux: Kernel extensions infrastructure support, Xenomai +
+	RTAI support.
 
 	Updated/fixed packages: busybox, dbus, dbus-glib, directfb,
 	dnsmasq, e2fsprogs, ethtool, fakeroot, fbdump, freetype, fuse,
-	gamin, jpeg, leafpad, libargtable2, libao, libconfuse,
-	libcuefile, libcurl, libreplaygain, libsamplerate, libsndfile,
-	libsoup, libsvgtiny, lighttpd, lzo, lzop, mpd, mpg123,
-	musepack, mysql_client, netcat, netsnmp, ntfs-3g, ntfsprogs,
-	openssl, radvd, samba, sdl_sound, sqlite, squid, sylpheed,
-	taglib, tar, tcpreplay, util-linux, xterm
-
-	New packages: fluxbox, libev, libftdi, libgeotiff, portaudio
+	gamin, gmp, jpeg, ipsec-tools, ipset, iptables, iw, leafpad,
+	libargtable2, libao, libconfuse, libcuefile, libcurl,
+	libevent, libreplaygain, libsamplerate, libsndfile, libsoup,
+	libsvgtiny, lighttpd, lzo, lzop, mpd, mpfr, mpg123, musepack,
+	mysql_client, netcat, netsnmp, ntfs-3g, ntfsprogs, openssh,
+	openssl, python, qt, radvd, samba, sdl_sound, sqlite, squid,
+	sylpheed, taglib, tar, tcpreplay, tslib, usbutils, util-linux,
+	xterm
+
+	New packages: fluxbox, libev, libftdi, libgeotiff, portaudio,
+	rtai, xenomai.
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#505:  live555: new package
+	#531:  let e2fsprogs package to export headers to staging dir if needed
+	#1171: Linuxthreads new cannot find sysdep.h
+	#2107: New package: input-event-daemon
+	#2599: New package: orc (Oil Runtime Compiler)
+	#2605: gstreamer: Update to 0.10.30
+	#2677: introducing util-linux-ng as replacement for util-linux
+	#2917: Qt: Add declarative module
+	#3145: jffs2 image generation fails
+	#3271: netperf-2.4.5 fails to compile
 	#4183: Codesourcery toolchain download site has changed
 
 2011.08, Released August 31th, 2011:
