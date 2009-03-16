From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:47:59 +0000 (UTC)
Subject: [Buildroot] svn commit: [25677] trunk/buildroot/package/mpfr
Message-ID: <20090316154759.366297643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:47:58 +0000 (Mon, 16 Mar 2009)
New Revision: 25677

Log:
mpfr: bump version

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-03-16 15:47:44 UTC (rev 25676)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-03-16 15:47:58 UTC (rev 25677)
@@ -3,8 +3,8 @@
 # mpfr
 #
 #############################################################
-MPFR_VERSION:=2.4.0
-#MPFR_PATCH:=patches
+MPFR_VERSION:=2.4.1
+MPFR_PATCH:=patches
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
