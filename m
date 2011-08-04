From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Aug 2011 22:13:37 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110804201503.0D4A08B505@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5255a7197b858c4cb5632e12d2097b75b68518e7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index caeff38..158ab6a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,14 +15,15 @@
 	Make source/external-deps now also works for external
 	toolchains / crosstool-ng backend.
 
-	Updated/fixed packages: berkeleydb, bind, binutils, bmon,
-	bridge-utils, busybox, cmake, dbus, dbus-glib, e2fsprogs,
-	ethtool, ffmpeg, gst-plugins-{bad,base,good,ugly}, gvfs,
-	hostapd, iproute2, iptables, jpeg, lame, libarchive, libdnet,
-	libdrm, libgcrypt, libgtk2, libmpeg2, libpng, lighttpd,
-	linux-fusion, lzo, mtd-utils, nfs-utils, oprofile, proftpd,
-	qt, ruby, sdl, shared-mime-info, sudo, sqlite, squid, synergy,
-	udev, usbmount, usbutils, util-linux, valgrind, webkit,
+	Updated/fixed packages: autoconf, berkeleydb, bind, binutils,
+	bmon, bridge-utils, busybox, cmake, dbus, dbus-glib,
+	e2fsprogs, ethtool, ffmpeg, gst-plugins-{bad,base,good,ugly},
+	gvfs, hostapd, iproute2, iptables, iw, jpeg, lame, libarchive,
+	libdnet, libdrm, libgcrypt, libgtk2, libmpeg2, libpng,
+	libsoup, lighttpd, linux-fusion, lzo, midori, mtd-utils,
+	nfs-utils, openvpn, oprofile, orc, proftpd, qt, ruby, samba,
+	sdl, shared-mime-info, sudo, sqlite, squid, synergy, udev,
+	usbmount, usbutils, util-linux, valgrind, webkit,
 	xorg-xserver, xz, zlib
 
 	New packages: acl, attr, ebtables, gnutls, inotify-tools,
-- 
1.7.3.4
