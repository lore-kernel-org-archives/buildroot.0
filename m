From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 13 Jul 2011 22:43:12 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110713204510.DCAB98A590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=333acf358b8b0b9f3d53c07e952be9a1c6f9bf03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   24 +++++++++++++++++-------
 1 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0b3e28a..06a7e53 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,13 +6,23 @@
 	ext-toolchain-wrapper improvements, improved non-MMU
 	support. GCC 4.3.6 / 4.6.1.
 
-	Updated/fixed packages: berkeleydb, bmon, busybox, dbus,
-	dbus-glib, ethtool, ffmpeg, gst-plugins-bad, gst-plugins-base,
-	lame, libarchive, libdnet, libgtk2, libmpeg2, lighttpd,
-	mtd-utils, oprofile, qt, ruby, sudo, sqlite, synergy,
-	usbutils, webkit
-
-	New packages: libiqrf, libnspr, libnss, live555, rsyslog,
+	GENTARGETS infrastructure extended to cover bootloaders and
+	Linux kernel as well. Options to retrive Linux/U-Boot from a
+	custom git repo instead of upstream tarballs.
+	Support for Linux 3.x and release candiate tarballs.
+	X-Loader bootloader for omap added.
+
+	Make source/external-deps now also works for external
+	toolchains / crosstool-ng backend.
+
+	Updated/fixed packages: berkeleydb, bmon, bridge-utils,
+	busybox, dbus, dbus-glib, ethtool, ffmpeg, gst-plugins-bad,
+	gst-plugins-base, lame, libarchive, libdnet, libgcrypt,
+	libgtk2, libmpeg2, lighttpd, mtd-utils, oprofile, qt, ruby,
+	sudo, sqlite, synergy, usbutils, valgrind, webkit
+
+	New packages: acl, attr, ebtables, gnutls, libargtable2,
+	libiqrf, libnspr, libnss, libroxml, live555, mxml, rsyslog,
 	sredird, statserial, stunnel, yajl
 
 	Issues resolved (http://bugs.uclibc.org):
-- 
1.7.3.4
