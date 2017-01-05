From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2017 10:32:59 -0300
Subject: [Buildroot] [PATCH] gdk-pixbuf: bump to version 2.36.3
Message-ID: <20170105133259.1490-1-gustavo@zacarias.com.ar>
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
index fc46b66..10feef7 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.2.sha256sum
-sha256	3a082ad67d68b55970aed0b2034a06618167be98a42d5c70de736756b45d325d	gdk-pixbuf-2.36.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.3.sha256sum
+sha256	5223138f7d31afc6b356a049930304ec0abd6ac1113a5d3d1dba5cd4a4d639ec	gdk-pixbuf-2.36.3.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 3954602..fab9c97 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).3
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
-- 
2.10.2
