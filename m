From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  5 Aug 2007 05:21:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tiff
Message-ID: <20070805122112.6A9FEA610E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-05 05:21:11 -0700 (Sun, 05 Aug 2007)
New Revision: 19405

Log:
- download times out; use debian instead


Modified:
   trunk/buildroot/package/tiff/tiff.mk


Changeset:
Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2007-08-05 12:10:35 UTC (rev 19404)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-08-05 12:21:11 UTC (rev 19405)
@@ -4,9 +4,9 @@
 #
 #############################################################
 TIFF_VERSION:=3.8.2
+TIFF_SOURCE:=tiff_$(TIFF_VERSION).orig.tar.gz
+TIFF_SITE:=http://ftp.debian.org/pool/main/t/tiff/
 TIFF_DIR:=$(BUILD_DIR)/tiff-$(TIFF_VERSION)
-TIFF_SITE:=ftp://ftp.remotesensing.org/libtiff
-TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
 TIFF_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(TIFF_SOURCE):
