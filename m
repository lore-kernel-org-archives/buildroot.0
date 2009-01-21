From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 21 Jan 2009 15:49:17 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20090121154918.0ED73770FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-21 15:49:17 +0000 (Wed, 21 Jan 2009)
New Revision: 24940

Log:
directfb: tarball moved to Old/

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2009-01-21 15:49:06 UTC (rev 24939)
+++ trunk/buildroot/package/directfb/directfb.mk	2009-01-21 15:49:17 UTC (rev 24940)
@@ -9,7 +9,7 @@
 DIRECTFB_VERSION:=1.2.6
 #DIRECTFB_VERSION:=1.3.0	is a development version
 #DIRECTFB_VERSION_MAJOR:=1.3
-DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
+DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_CAT:=$(ZCAT)
 DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
