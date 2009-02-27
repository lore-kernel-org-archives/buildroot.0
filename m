From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 27 Feb 2009 14:59:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20090227145918.566F977191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-27 14:59:17 +0000 (Fri, 27 Feb 2009)
New Revision: 25468

Log:
libpng: bump version

Fixes unitialized data bug (CVE-2009-0040).

Patch by Soef Qued <souf_oued@yahoo.fr>

Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2009-02-26 20:57:29 UTC (rev 25467)
+++ trunk/buildroot/package/libpng/libpng.mk	2009-02-27 14:59:17 UTC (rev 25468)
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.34
+LIBPNG_VERSION:=1.2.35
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
