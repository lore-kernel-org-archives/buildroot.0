From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 21:02:26 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: bump to version 2.34.0
Message-ID: <20160325200622.1A2C181D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03a35862f2f59e378411227dd712bdaf7dfc0e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 186e158..e73170c 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.3.sha256sum
-sha256	2b6771f1ac72f687a8971e59810b8dc658e65e7d3086bd2e676e618fd541d031	gdk-pixbuf-2.32.3.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.34/gdk-pixbuf-2.34.0.sha256sum
+sha256	d55e5b383ee219bd0e23bf6ed4427d56a7db5379729a6e3e0a0e0eba9a8d8879	gdk-pixbuf-2.34.0.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index cedb9ce..03594d8 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GDK_PIXBUF_VERSION_MAJOR = 2.32
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).3
+GDK_PIXBUF_VERSION_MAJOR = 2.34
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).0
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
