From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 08:33:57 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmp
Message-ID: <20090213083357.890CA76449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-13 08:33:57 +0000 (Fri, 13 Feb 2009)
New Revision: 25313

Log:
gmp: use GNU_MIRROR for site

Modified:
   trunk/buildroot/package/gmp/gmp.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2009-02-13 08:33:50 UTC (rev 25312)
+++ trunk/buildroot/package/gmp/gmp.mk	2009-02-13 08:33:57 UTC (rev 25313)
@@ -5,7 +5,7 @@
 #############################################################
 GMP_VERSION:=4.2.4
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
-GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp
+GMP_SITE:=$(BR2_GNU_MIRROR)/gmp
 GMP_CAT:=$(BZCAT)
 GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
