From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:48:08 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: security bump to version 2.32.3
Message-ID: <20151215204833.2226181DD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7b80100b8fab231a8d41fe0b55eb41623c9d2ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
* Fix two crashes in the bmp loader (#747605, #758991)
* ico: integer overflow fixes

No CVEs assigned yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 478d96a..186e158 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.2.sha256sum
-sha256	d3ab06fc123b13effed4c27c77cebdfad2173ff20628d82c397b7660ae926145	gdk-pixbuf-2.32.2.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.3.sha256sum
+sha256	2b6771f1ac72f687a8971e59810b8dc658e65e7d3086bd2e676e618fd541d031	gdk-pixbuf-2.32.3.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index a41c262..be79e11 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.32
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).3
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
