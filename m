From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 20 Aug 2007 06:00:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20070820130014.12B6AA466E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-20 06:00:14 -0700 (Mon, 20 Aug 2007)
New Revision: 19590

Log:
- whitespace fixes


Modified:
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-08-20 09:25:47 UTC (rev 19589)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-08-20 13:00:14 UTC (rev 19590)
@@ -62,13 +62,13 @@
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 BINUTILS_SITE:=$(VENDOR_SITE)
 endif
 
 BINUTILS_OFFICIAL_VERSION:=$(BINUTILS_VERSION)$(VENDOR_SUFFIX)$(VENDOR_BINUTILS_RELEASE)
 
-ifeq	($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
 else
 BINUTILS_PATCH_DIR:=$(VENDOR_PATCH_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)
