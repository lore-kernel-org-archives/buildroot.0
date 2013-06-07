From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri,  7 Jun 2013 18:18:47 -0500
Subject: [Buildroot] [PATCH v10 02/13] gdk-pixbuf: bump to version 2.28.1
In-Reply-To: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
References: <1370647138-26623-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1370647138-26623-3-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 49d3840..87775bb 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDK_PIXBUF_MAJOR_VERSION = 2.24
+GDK_PIXBUF_MAJOR_VERSION = 2.28
 GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).1
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
-- 
1.7.1
