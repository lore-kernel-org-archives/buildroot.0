From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 08:34:01 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20090213083402.2F2EB76449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-13 08:34:01 +0000 (Fri, 13 Feb 2009)
New Revision: 25314

Log:
mpfr: bump version

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-02-13 08:33:57 UTC (rev 25313)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-02-13 08:34:01 UTC (rev 25314)
@@ -3,7 +3,7 @@
 # mpfr
 #
 #############################################################
-MPFR_VERSION:=2.3.2
+MPFR_VERSION:=2.4.0
 #MPFR_PATCH:=patches
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
@@ -13,7 +13,7 @@
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
 MPFR_HOST_BINARY:=libmpfr$(HOST_LIBEXT)
-MPFR_LIBVERSION:=1.1.2
+MPFR_LIBVERSION:=1.2.0
 
 # need patch
 ifneq ($(MPFR_PATCH),)
