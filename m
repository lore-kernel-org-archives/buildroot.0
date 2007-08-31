From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 31 Aug 2007 07:30:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070831143022.A75FAA6110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-31 07:30:22 -0700 (Fri, 31 Aug 2007)
New Revision: 19741

Log:
- bump version


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-08-31 14:27:07 UTC (rev 19740)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-08-31 14:30:22 UTC (rev 19741)
@@ -3,8 +3,8 @@
 # mpfr
 #
 #############################################################
-MPFR_VERSION:=2.2.1
-MPFR_PATCH:=patches
+MPFR_VERSION:=2.3.0
+#MPFR_PATCH:=patches
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
