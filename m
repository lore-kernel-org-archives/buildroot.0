From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 27 Mar 2017 17:22:47 +0100
Subject: [Buildroot] [PATCH] gdk-pixbuf: bump version to 2.36.6
Message-ID: <20170327162247.42862-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index e92f498..ebb03a8 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.5.sha256sum
-sha256	7ace06170291a1f21771552768bace072ecdea9bd4a02f7658939b9a314c40fc	gdk-pixbuf-2.36.5.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.6.sha256sum
+sha256 455eb90c09ed1b71f95f3ebfe1c904c206727e0eeb34fc94e5aaf944663a820c  gdk-pixbuf-2.36.6.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 0f4eeb1..bf83b19 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).5
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).6
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
-- 
2.10.2
