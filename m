From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Jun 2013 21:58:36 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: bump to version 2.28.1
Message-ID: <20130608224115.16A839AA3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=003a000d629fcd06b759e0c3528fe7697a942708
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
