From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 8 Apr 2012 08:24:25 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: bump version
Message-ID: <20120408062543.422A190377@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b9eb5713d971cb9af7c75e92a9647e0fd449a9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 2.26 series needs glib >= 2.31.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 65b3dbd..de80706 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-GDK_PIXBUF_MAJOR_VERSION = 2.22
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).0
-GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.bz2
+GDK_PIXBUF_MAJOR_VERSION = 2.24
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_MAJOR_VERSION).1
+GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_MAJOR_VERSION)
 GDK_PIXBUF_INSTALL_STAGING = YES
 
