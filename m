From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 15:04:02 +0100
Subject: [Buildroot] [git commit] gdk-pixbuf: bump to 2.30.8
Message-ID: <20141101140727.4D935B2841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fe7fd6a895266d2d17beb6a9baedaeb17714a13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump gdk-pixbuf to version 2.30.8.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
