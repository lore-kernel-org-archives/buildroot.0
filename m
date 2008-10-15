From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Oct 2008 16:49:30 +0200
Subject: [Buildroot] [PATCH] Bump up libgtk2 version
Message-ID: <20081015164930.6a6fc189@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump up libgtk2 version

The version of libgtk2 currently used doesn't build when built against
DirectFB. The issue has been fixed in a later version of the 2.12.x
series, so let's upgrade to this version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- buildroot.orig/package/libgtk2/libgtk2.mk
+++ buildroot/package/libgtk2/libgtk2.mk
@@ -3,7 +3,7 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION = 2.12.6
+LIBGTK2_VERSION = 2.12.12
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
 LIBGTK2_SITE = ftp://ftp.gtk.org/pub/gtk/2.12
 LIBGTK2_AUTORECONF = NO

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
