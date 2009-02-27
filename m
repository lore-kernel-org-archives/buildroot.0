From: Souf Oued <souf_oued@yahoo.fr>
Date: Fri, 27 Feb 2009 14:41:33 +0100
Subject: [Buildroot] [PATCH]: update libpng to 1.2.35
Message-ID: <49A7ED8D.9030401@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
--- buildroot/package/libpng/libpng.mk.orig    2009-02-27 
14:17:36.000000000 +0100
+++ buildroot/package/libpng/libpng.mk    2009-02-27 14:17:47.000000000 
+0100
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.34
+LIBPNG_VERSION:=1.2.35
 LIBPNG_SITE = 
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO

Malek
