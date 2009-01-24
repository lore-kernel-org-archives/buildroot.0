From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 24 Jan 2009 10:20:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20090124102036.ABC18769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-24 10:20:36 +0000 (Sat, 24 Jan 2009)
New Revision: 25001

Log:
freetype: fix typo

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-01-24 10:16:53 UTC (rev 25000)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-01-24 10:20:36 UTC (rev 25001)
@@ -11,7 +11,7 @@
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_DEPENDENCIES = uclibc pkgconfig $(if $(BR2_PACKAGE_ZLIB,zlib)
+FREETYPE_DEPENDENCIES = uclibc pkgconfig $(if $(BR2_PACKAGE_ZLIB),zlib)
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
