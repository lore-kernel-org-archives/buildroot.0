From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jan 2011 00:11:40 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110102231217.423808E203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=639e80f27460977a7c689815db2ac06476789b27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   29 +++++++++++++++++++++--------
 1 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index a67d1d1..8f7fc5c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,16 +3,29 @@
 	Ccache support reworked. Now used for both host and target
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
-	Updated/fixed packages: alsa-utils, at, busybox, bzip2, dbus,
-	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
-	hostapd, i2c-tools, input-tools, libaio, libconfig, libtheora,
-	lsof, ltp-testsuite, lvm2, m4, memtester, mii-diag, mplayer,
-	mrouted, netplug, openssh, openssl, openvpn, pango, qt, rsync,
-	sdl_gfx, sdl_sound, sysklogd, sysvinit, udev, usbutils,
+	Toolchain: uClibc 0.9.32-rc1, several components moved to
+	normal AUTOTARGET packages.
+
+	Support for bzr downloads, next to the existing git/svn support.
+
+	EXT2 file system size handling improved. U-Boot 2010.12 added.
+
+	Updated/fixed packages: alsa-utils, at, autoconf, automake,
+	binutils, bison, busybox, bzip2, cloop, cups, dbus,
+	direcfb-examples, dmalloc, ed, ffmpeg, findutils, freetype,
+	gdk-pixbuf, gmp, grep, gst-plugins-good, gvfs, hostapd,
+	i2c-tools, icu, input-tools, jpeg, libaio, libcap, libconfig,
+	libglib2, libogg, libtheora, libtool, libvorbis, libxml2,
+	libxslt, linux-fusion, lsof, ltp-testsuite, lvm2, m4,
+	memtester, mesa3d, mii-diag, mpc, mpfr, mplayer, mrouted,
+	nano, netperf, netplug, openssh, openssl, openvpn, oprofile,
+	pango, patch, php, portmap, qt, rsync, screen, sdl_gfx,
+	sdl_sound, sqlite, squid, sstrip, sysklogd, sysvinit, tar,
+	tslib, udev, usbutils, vim, vtun, webkit, xapp_xlogo,
 	xkeyboard-config, xlib_libX11, xz, zlib
 
-	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone,
-	xl2tp
+	New packages: dhrystone, fbgrab, lsuio, rsh-redone, sdparm,
+	whetstone, xl2tp
 
 	Removed packages: hotplug, l2tp, libfloat, microcom,
 	ng-spice-rework
-- 
1.7.2.2
