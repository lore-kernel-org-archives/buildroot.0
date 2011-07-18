From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jul 2011 23:34:10 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110718213424.0980A8AE6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82b23f3be19600da5dccd3d8989d92d02448f88d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index a6016cc..7f8cb82 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,14 +16,16 @@
 	toolchains / crosstool-ng backend.
 
 	Updated/fixed packages: berkeleydb, bmon, bridge-utils,
-	busybox, dbus, dbus-glib, ethtool, ffmpeg, gst-plugins-bad,
-	gst-plugins-base, lame, libarchive, libdnet, libgcrypt,
-	libgtk2, libmpeg2, lighttpd, mtd-utils, oprofile, qt, ruby,
-	sudo, sqlite, synergy, usbutils, valgrind, webkit
+	busybox, cmake, dbus, dbus-glib, ethtool, ffmpeg,
+	gst-plugins-bad, gst-plugins-base, gvfs, jpeg, lame,
+	libarchive, libdnet, libgcrypt, libgtk2, libmpeg2, libpng,
+	lighttpd, linux-fusion, lzo, mtd-utils, oprofile, proftpd, qt,
+	ruby, shared-mime-info, sudo, sqlite, synergy, usbutils,
+	valgrind, webkit, xz
 
 	New packages: acl, attr, ebtables, gnutls, libargtable2,
-	libiqrf, libnspr, libnss, libroxml, live555, mxml, rsyslog,
-	sredird, statserial, stunnel, yajl
+	libiqrf, libnspr, libnss, libroxml, libyaml, live555, mxml,
+	rsyslog, sredird, statserial, stunnel, uboot-tools, yajl
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.7.3.4
