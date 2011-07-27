From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jul 2011 00:01:47 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110727220214.6542E8B525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a4a20acb2e7a4e050ead17097660ee0892fed172
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   27 ++++++++++++++++-----------
 1 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8396dce..cf01121 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,17 +15,22 @@
 	Make source/external-deps now also works for external
 	toolchains / crosstool-ng backend.
 
-	Updated/fixed packages: berkeleydb, bmon, bridge-utils,
-	busybox, cmake, dbus, dbus-glib, ethtool, ffmpeg,
-	gst-plugins-bad, gst-plugins-base, gvfs, jpeg, lame,
-	libarchive, libdnet, libgcrypt, libgtk2, libmpeg2, libpng,
-	lighttpd, linux-fusion, lzo, mtd-utils, oprofile, proftpd, qt,
-	ruby, shared-mime-info, sudo, sqlite, synergy, usbutils,
-	valgrind, webkit, xz
-
-	New packages: acl, attr, ebtables, gnutls, libargtable2,
-	libiqrf, libnspr, libnss, libroxml, libyaml, live555, mxml,
-	rsyslog, sredird, statserial, stunnel, uboot-tools, yajl
+	Updated/fixed packages: berkeleydb, bind, binutils, bmon,
+	bridge-utils, busybox, cmake, dbus, dbus-glib, e2fsprogs,
+	ethtool, ffmpeg, gst-plugins-{bad,base,good,ugly}, gvfs,
+	hostapd, iproute2, iptables, jpeg, lame, libarchive, libdnet,
+	libdrm, libgcrypt, libgtk2, libmpeg2, libpng, lighttpd,
+	linux-fusion, lzo, mtd-utils, nfs-utils, oprofile, proftpd,
+	qt, ruby, sdl, shared-mime-info, sudo, sqlite, squid, synergy,
+	udev, usbmount, usbutils, util-linux, valgrind, webkit,
+	xorg-xserver, xz, zlib
+
+	New packages: acl, attr, ebtables, gnutls, inotify-tools,
+	ipset, libargtable2, libiqrf, libmnl, libnspr, libnss,
+	libroxml, libyaml, live555, mxml, orc, rsyslog, sredird,
+	statserial, stunnel, ti-utils, uboot-tools, yajl
+
+	Removed packages: hal
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.7.3.4
