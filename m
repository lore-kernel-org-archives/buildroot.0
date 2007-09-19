From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 11:46:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070919184647.1A9653004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 11:46:45 -0700 (Wed, 19 Sep 2007)
New Revision: 19897

Log:
- don't strip the host binaries for now


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-19 18:18:09 UTC (rev 19896)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-19 18:46:45 UTC (rev 19897)
@@ -54,7 +54,7 @@
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 GCC_CAT:=$(BZCAT)
-GCC_STRIP_HOST_BINARIES:=true
+GCC_STRIP_HOST_BINARIES:=nope
 
 
 ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
