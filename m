From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Mar 2009 20:20:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090301202010.0557F769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-01 20:20:09 +0000 (Sun, 01 Mar 2009)
New Revision: 25472

Log:
toolchain/gcc: libstdcpp dependency was listed twice

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-03-01 04:50:18 UTC (rev 25471)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-03-01 20:20:09 UTC (rev 25472)
@@ -88,7 +88,6 @@
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/libgcj*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/objc*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/fortran*)\
-$(wildcard $(BR2_DEPENDS_DIR)/br2/install/libstdcpp*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/prefer/ima*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/toolchain/sysroot*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/use/sjlj/exceptions*)\
