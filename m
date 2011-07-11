From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jul 2011 07:44:24 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110711054508.184828A42F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bd76bc5f80b963570e8eda92efc961e683264402
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 3419590..4c29ffe 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,17 +2,23 @@
 
 	Fixes all over the tree and new features.
 
-	Toolchain: uClibc 0.9.32 / NPTL support, ext-toolchain-wrapper
-	improvements, improved non-MMU support.
+	Toolchain: uClibc 0.9.32 / NPTL support, 0.9.29 removed,
+	ext-toolchain-wrapper improvements, improved non-MMU
+	support. GCC 4.3.6 / 4.6.1.
 
 	Updated/fixed packages: berkeleydb, bmon, busybox, dbus,
-	dbus-glib, ethtool, ffmpeg, gst-plugins-bad, libdnet,
-	libmpeg2, mtd-utils, qt, sudo, synergy, usbutils, webkit
+	dbus-glib, ethtool, ffmpeg, gst-plugins-bad, gst-plugins-base,
+	lame, libarchive, libdnet, libgtk2, libmpeg2, lighttpd,
+	mtd-utils, oprofile, qt, ruby, sudo, sqlite, synergy,
+	usbutils, webkit
 
-	New packages: live555, sredird, statserial, yajl
+	New packages: libiqrf, libnspr, libnss, live555, rsyslog,
+	sredird, statserial, stunnel, yajl
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#3559: libnspr: Add new package
+	#3565: libnss: Add new package
 	#3907: 2011.05 - Qt 4.7.3 not building on ARM
 
 2011.05, Released May 27th, 2011:
-- 
1.7.3.4
