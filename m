From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 17 Sep 2007 06:12:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gmp
Message-ID: <20070917131238.B652330059@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-17 06:12:38 -0700 (Mon, 17 Sep 2007)
New Revision: 19872

Log:
- libversion was changed


Modified:
   trunk/buildroot/package/gmp/gmp.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-09-17 12:49:46 UTC (rev 19871)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-09-17 13:12:38 UTC (rev 19872)
@@ -11,7 +11,7 @@
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp$(LIBTGTEXT)
 GMP_HOST_BINARY:=libgmp$(HOST_SHREXT)
-GMP_LIBVERSION:=3.4.1
+GMP_LIBVERSION:=3.4.2
 
 # this is a workaround for a bug in GMP, please see
 # http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
