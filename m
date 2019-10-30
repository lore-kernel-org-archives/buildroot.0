From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 30 Oct 2019 16:50:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgtk3: bump to version 3.24.12
Message-ID: <20191030155011.11653-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix the build with latest pango thanks to
https://github.com/GNOME/gtk/commit/4c94a76237446f22646a5367bdf48b6b13eeff92

Fixes:
 - http://autobuild.buildroot.org/results/f0eda37930ca3054bcc8ab3a8aef74bbc71b5997

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index b7a89901dd..dd902624cf 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.30.sha256sum
-sha256 a1a4a5c12703d4e1ccda28333b87ff462741dc365131fbc94c218ae81d9a6567  gtk+-3.22.30.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.12.sha256sum
+sha256 1384eba5614fed160044ae0d32369e3df7b4f517b03f4b1f24d383e528f4be83  gtk+-3.24.12.tar.xz
 
 # Hash for license file:
 sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index b9adc673f5..fc131132f9 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK3_VERSION_MAJOR = 3.22
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).30
+LIBGTK3_VERSION_MAJOR = 3.24
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).12
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
-- 
2.23.0
