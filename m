From: prpplague at uclibc.org <prpplague@uclibc.org>
Date: Fri,  4 Jan 2008 12:07:32 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20080104200732.1314212011C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: prpplague
Date: 2008-01-04 12:07:31 -0800 (Fri, 04 Jan 2008)
New Revision: 20708

Log:
change download url to be dynamic basic on version number

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2008-01-04 15:28:28 UTC (rev 20707)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2008-01-04 20:07:31 UTC (rev 20708)
@@ -8,7 +8,7 @@
 MPFR_PATCH_FILE:=mpfr-$(MPFR_VERSION).patch
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
-MPFR_SITE:=http://www.mpfr.org/mpfr-current/
+MPFR_SITE:=http://www.mpfr.org/mpfr-$(MPFR_VERSION)/
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
