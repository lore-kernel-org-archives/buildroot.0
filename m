From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 14 Jan 2011 22:02:47 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110114210302.695718B52A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7f40dfc1b676a34fe257dc0dd0a25dfe69416d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   34 ++++++++++++++++++----------------
 1 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8f7fc5c..15ae301 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,24 +8,26 @@
 
 	Support for bzr downloads, next to the existing git/svn support.
 
-	EXT2 file system size handling improved. U-Boot 2010.12 added.
+	EXT2 file system size handling improved, UBI image support, fs
+	configuration options cleanup, U-Boot/Barebox version bumps.
 
 	Updated/fixed packages: alsa-utils, at, autoconf, automake,
-	binutils, bison, busybox, bzip2, cloop, cups, dbus,
-	direcfb-examples, dmalloc, ed, ffmpeg, findutils, freetype,
-	gdk-pixbuf, gmp, grep, gst-plugins-good, gvfs, hostapd,
-	i2c-tools, icu, input-tools, jpeg, libaio, libcap, libconfig,
-	libglib2, libogg, libtheora, libtool, libvorbis, libxml2,
-	libxslt, linux-fusion, lsof, ltp-testsuite, lvm2, m4,
-	memtester, mesa3d, mii-diag, mpc, mpfr, mplayer, mrouted,
-	nano, netperf, netplug, openssh, openssl, openvpn, oprofile,
-	pango, patch, php, portmap, qt, rsync, screen, sdl_gfx,
-	sdl_sound, sqlite, squid, sstrip, sysklogd, sysvinit, tar,
-	tslib, udev, usbutils, vim, vtun, webkit, xapp_xlogo,
-	xkeyboard-config, xlib_libX11, xz, zlib
-
-	New packages: dhrystone, fbgrab, lsuio, rsh-redone, sdparm,
-	whetstone, xl2tp
+	binutils, bison, busybox, bzip2, cloop, coreutils, cups, dbus,
+	direcfb-examples, dmalloc, ed, ffmpeg, findutils, flac,
+	freetype, gdk-pixbuf, gmp, grep, gst-plugins-good, gvfs,
+	hostapd, i2c-tools, icu, input-tools, iproute2, iptables,
+	jpeg, libaio, libcap, libconfig, libglib2, libogg, libtheora,
+	libtool, libvorbis, libxml2, libxslt, linux-fusion, lsof,
+	ltp-testsuite, ltrace, lvm2, m4, memtester, mesa3d, mii-diag,
+	mpc, mpfr, mplayer, mrouted, nano, netperf, netplug, openssh,
+	openssl, openvpn, oprofile, pango, patch, pciutils, php,
+	portmap, qt, rsync, screen, sdl_gfx, sdl_sound, sqlite, squid,
+	sstrip, sysklogd, sysvinit, tar, tslib, udev, usbutils, vim,
+	vtun, webkit, xapp_xlogo, xkeyboard-config, xlib_libX11, xz,
+	zlib
+
+	New packages: dhrystone, fbgrab, irda-utils, libao, lsuio,
+	rsh-redone, sdparm, vorbis-tools, whetstone, xl2tp
 
 	Removed packages: hotplug, l2tp, libfloat, microcom,
 	ng-spice-rework
-- 
1.7.2.2
