From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Apr 2018 13:38:38 +0200
Subject: [Buildroot] [PATCH 09/10] libglib2: bump to version 2.56.1
Message-ID: <20180407113838.13220-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add myself to DEVELOPERS

Fixes:
 - http://autobuild.buildroot.net/results/58d98c26ca0214e195d5de193b82445a856b9b7e (see https://github.com/GNOME/glib/commit/e2c16df4b5e6d31b6513bebb4a2bc1c5075fff47#diff-cd235eb1f377a526e7e78471ff2d4d6a)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                     | 1 +
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 10b20c259b..b797087191 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -669,6 +669,7 @@ F:	package/hiredis/
 F:	package/i2pd/
 F:	package/igd2-for-linux/
 F:	package/libcdio-paranoia/
+F:	package/libglib2/
 F:	package/libmpdclient/
 F:	package/libupnp/
 F:	package/libupnp18/
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index b957bf4b10..7ce031aa89 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.56/glib-2.56.0.sha256sum
-sha256  ecef6e17e97b8d9150d0e8a4b3edee1ac37331213b8a2a87a083deea408a0fc7  glib-2.56.0.tar.xz
+# https://download.gnome.org/sources/glib/2.56/glib-2.56.1.sha256sum
+sha256  40ef3f44f2c651c7a31aedee44259809b6f03d3d20be44545cd7d177221c0b8d  glib-2.56.1.tar.xz
 # License files, locally calculated
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 41ec7ee377..a32a9bab52 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.56
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).0
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.0+
-- 
2.14.1
