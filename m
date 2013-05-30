From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 30 May 2013 11:30:25 -0500
Subject: [Buildroot] [PATCH v9 02/14] gdk-pixbuf: bump to version 2.28.1
In-Reply-To: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1369931437-12445-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4e00c40..841f236 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GDK_PIXBUF_MAJOR_VERSION = 2.24
+GDK_PIXBUF_MAJOR_VERSION = 2.28
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).1
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
-- 
1.7.9.5
