From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 17 Sep 2007 04:20:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070917112014.16D1330050@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-17 04:20:14 -0700 (Mon, 17 Sep 2007)
New Revision: 19865

Log:
- apply fixes for 2.3.0


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-09-17 11:19:04 UTC (rev 19864)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-09-17 11:20:14 UTC (rev 19865)
@@ -4,7 +4,7 @@
 #
 #############################################################
 MPFR_VERSION:=2.3.0
-#MPFR_PATCH:=patches
+MPFR_PATCH:=patches
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
