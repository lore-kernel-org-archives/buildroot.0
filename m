From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 10 Oct 2013 18:01:17 +0200
Subject: [Buildroot] [PATCH 1/1] gdk-pixbuf: bump to version 2.28.2
Message-ID: <1381420877-7862-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 8bfb35d..d1d590a 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_MAJOR_VERSION = 2.28
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).1
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).2
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
 GDK_PIXBUF_LICENSE = LGPLv2+
-- 
1.7.9.5
