From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 16:35:44 -0300
Subject: [Buildroot] [PATCH] gdk-pixbuf: bump to version 2.32.2
Message-ID: <1447443344-1467-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 3bf6ae6..478d96a 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.1.sha256sum
-sha256	4432b74f25538c7d6bcb3ca51adabdd666168955f25812a2568dc9637697f3bc	gdk-pixbuf-2.32.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.2.sha256sum
+sha256	d3ab06fc123b13effed4c27c77cebdfad2173ff20628d82c397b7660ae926145	gdk-pixbuf-2.32.2.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 1167fb9..a41c262 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.32
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).1
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
-- 
2.4.10
