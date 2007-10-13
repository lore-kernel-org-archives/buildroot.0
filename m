From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 16:09:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmp
Message-ID: <20071013230949.EDC72A616F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 16:09:49 -0700 (Sat, 13 Oct 2007)
New Revision: 20247

Log:
Remove superfluous 'slash' in GMP_SITE

Modified:
   trunk/buildroot/package/gmp/gmp.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-10-13 23:08:55 UTC (rev 20246)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-10-13 23:09:49 UTC (rev 20247)
@@ -5,7 +5,7 @@
 #############################################################
 GMP_VERSION:=4.2.2
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
-GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp/
+GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp
 GMP_CAT:=$(BZCAT)
 GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
