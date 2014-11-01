From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  1 Nov 2014 10:21:32 +0100
Subject: [Buildroot] [PATCH 4/6] gdk-pixbuf: bump to 2.30.8
In-Reply-To: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1414833694-4236-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1414833694-4236-5-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump gdk-pixbuf to version 2.30.8.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 71ec67f..a4e3af0 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GDK_PIXBUF_VERSION_MAJOR = 2.28
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
+GDK_PIXBUF_VERSION_MAJOR = 2.30
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).8
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
-- 
1.9.3
