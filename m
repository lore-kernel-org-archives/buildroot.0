From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 23 Sep 2007 14:23:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070923212311.37E8930046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-23 14:23:10 -0700 (Sun, 23 Sep 2007)
New Revision: 19980

Log:
- rebuild compiler if libstdcpp setting was changed


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-23 20:46:44 UTC (rev 19979)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-23 21:23:10 UTC (rev 19980)
@@ -90,6 +90,7 @@
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/libgcj*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/objc*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/install/fortran*)\
+$(wildcard $(BR2_DEPENDS_DIR)/br2/install/libstdcpp*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/prefer/ima*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/toolchain/sysroot*)\
 $(wildcard $(BR2_DEPENDS_DIR)/br2/use/sjlj/exceptions*)\
