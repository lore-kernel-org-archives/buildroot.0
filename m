From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Oct 2013 23:06:49 +0200
Subject: [Buildroot] [git commit] gdk-pixbuf: bump to version 2.28.2
Message-ID: <20131010211037.75CA59A139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c551ac4cff997c26cc8ee26ab2fe1437cbbfa3d9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
