From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 15:26:28 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110120142701.4E94F8A5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3c51d90a663889f8586bf23fa95c392fa2c85d64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   33 ++++++++++++++++++---------------
 1 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/CHANGES b/CHANGES
index a825511..27e9bf7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,22 +12,25 @@
 	configuration options cleanup, U-Boot/Barebox version bumps.
 
 	Updated/fixed packages: alsa-utils, at, autoconf, automake,
-	binutils, bison, busybox, bzip2, cloop, coreutils, cups, dbus,
-	direcfb-examples, dmalloc, ed, ffmpeg, findutils, flac,
-	freetype, gdk-pixbuf, gmp, grep, gst-plugins-good, gvfs,
-	hostapd, i2c-tools, icu, input-tools, iproute2, iptables,
-	jpeg, kexec, libaio, libcap, libconfig, libglib2, libogg,
+	bash, binutils, bison, busybox, bzip2, cloop, coreutils, cups,
+	dbus, direcfb-examples, dmalloc, dosfstools, ed, ffmpeg,
+	findutils, flac, freetype, gdk-pixbuf, gmp, grep, gperf,
+	gst-plugins-good, gvfs, hdparm, hostapd, i2c-tools, icu,
+	input-tools, iproute2, iptables, jpeg, kexec, libaio, libcap,
+	libconfig, libfuse, libglib2, libmad, libogg, libsndfile,
 	libtheora, libtool, libvorbis, libxml2, libxslt, linux-fusion,
-	lsof, ltp-testsuite, ltrace, lvm2, m4, makedevs, memtester,
-	mesa3d, mii-diag, mpc, mpfr, mplayer, mrouted, nano, netperf,
-	netplug, openssh, openssl, openvpn, oprofile, pango, patch,
-	pciutils, php, portmap, qt, rsync, screen, sdl_gfx, sdl_sound,
-	sqlite, squid, sstrip, sysklogd, sysvinit, tar, tslib, udev,
-	usbutils, vim, vtun, webkit, xapp_xlogo, xkeyboard-config,
-	xlib_libX11, xz, zlib
-
-	New packages: dhrystone, fbgrab, irda-utils, libao, lsuio,
-	rsh-redone, sdparm, vorbis-tools, whetstone, xl2tp
+	lm-sensors, lsof, ltp-testsuite, ltrace, lvm2, m4, makedevs,
+	memtester, mesa3d, mii-diag, mpc, mpfr, mpg123, mplayer,
+	mrouted, nano, netperf, netplug, ntfs-3g, openssh, openssl,
+	openvpn, oprofile, pango, patch, pciutils, php, portmap,
+	psmisc, qt, rsync, screen, sdl_gfx, sdl_sound, smartmontools,
+	sqlite, squid, sshfs, sstrip, sysklogd, sysstat, sysvinit,
+	tar, tcpdump, tslib, udev, usbutils, vim, vtun, webkit, wipe,
+	xapp_xlogo, xkeyboard-config, xlib_libX11, xz, zlib
+
+	New packages: dhrystone, faad2, fbgrab, irda-utils, libao,
+	libreplaygain, libsamplerate, libsigc++, lsuio, rsh-redone,
+	sdparm, vorbis-tools, wavpack, whetstone, xl2tp
 
 	Removed packages: hotplug, l2tp, libfloat, microcom,
 	ng-spice-rework
-- 
1.7.3.4
