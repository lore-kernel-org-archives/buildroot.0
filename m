From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 08:33:51 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmp
Message-ID: <20090213083351.DEA6276449@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-13 08:33:50 +0000 (Fri, 13 Feb 2009)
New Revision: 25312

Log:
gmp: bump version

Modified:
   trunk/buildroot/package/gmp/gmp.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2009-02-13 00:02:54 UTC (rev 25311)
+++ trunk/buildroot/package/gmp/gmp.mk	2009-02-13 08:33:50 UTC (rev 25312)
@@ -3,7 +3,7 @@
 # gmp
 #
 #############################################################
-GMP_VERSION:=4.2.2
+GMP_VERSION:=4.2.4
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
 GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp
 GMP_CAT:=$(BZCAT)
@@ -11,7 +11,7 @@
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp$(LIBTGTEXT)
 GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
-GMP_LIBVERSION:=3.4.2
+GMP_LIBVERSION:=3.4.4
 
 # this is a workaround for a bug in GMP, please see
 # http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
