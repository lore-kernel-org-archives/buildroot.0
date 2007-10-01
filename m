From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  1 Oct 2007 14:06:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071001210653.94143A65C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-01 14:06:50 -0700 (Mon, 01 Oct 2007)
New Revision: 20165

Log:
- remove misplaced comment


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-01 18:04:42 UTC (rev 20164)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-10-01 21:06:50 UTC (rev 20165)
@@ -54,7 +54,7 @@
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=nope
-GCC_SRC_DIR=$(GCC_DIR) # for stage2 and stage3 compilers. Usually same as stage1
+GCC_SRC_DIR:=$(GCC_DIR)
 
 ifeq ($(findstring x3.,x$(GCC_VERSION)),x3.)
 GCC_NO_MPFR:=y
