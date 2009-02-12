From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Feb 2009 12:17:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20090212121713.5F87A76440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-12 12:17:12 +0000 (Thu, 12 Feb 2009)
New Revision: 25306

Log:
libpng: bump version

Fixes memory leak and double-free vulnerability

Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2009-02-12 09:33:01 UTC (rev 25305)
+++ trunk/buildroot/package/libpng/libpng.mk	2009-02-12 12:17:12 UTC (rev 25306)
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.32
+LIBPNG_VERSION:=1.2.34
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
