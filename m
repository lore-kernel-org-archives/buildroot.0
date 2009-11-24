From: Daniel Mack <daniel@caiaq.de>
Date: Tue, 24 Nov 2009 15:32:37 +0100
Subject: [Buildroot] [PATCH] libglib2: bump version number to 2.22
Message-ID: <1259073157-19511-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building gvfs, I encountered the following error:

  checking for GLIB... configure: error: Package requirements (glib-2.0 >= 2.21.2 gthread-2.0 gobject-2.0 gmodule-no-export-2.0 gio-unix-2.0 gio-2.0 ) were not met:
  Requested 'glib-2.0 >= 2.21.2' but version of GLib is 2.20.5

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/libglib2/libglib2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 7100800..c7d69f3 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -3,8 +3,8 @@
 # libglib2
 #
 #############################################################
-LIBGLIB2_VERSION_MAJOR = 2.20
-LIBGLIB2_VERSION_MINOR = 5
+LIBGLIB2_VERSION_MAJOR = 2.22
+LIBGLIB2_VERSION_MINOR = 2
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gtk.org/pub/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.6.5.2
