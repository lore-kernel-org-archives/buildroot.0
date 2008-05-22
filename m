From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 May 2008 14:40:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20080522214051.7222C3C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-22 14:40:50 -0700 (Thu, 22 May 2008)
New Revision: 22058

Log:
Remove superfluos slash character from MPFR_SITE

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2008-05-22 21:39:22 UTC (rev 22057)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2008-05-22 21:40:50 UTC (rev 22058)
@@ -8,7 +8,7 @@
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
-MPFR_SITE:=http://www.mpfr.org/mpfr-$(MPFR_VERSION)/
+MPFR_SITE:=http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
