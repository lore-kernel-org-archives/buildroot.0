From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 10:21:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081223102108.59EE676A3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-23 10:21:07 +0000 (Tue, 23 Dec 2008)
New Revision: 24518

Log:
toolchain/uclibc: fix typo

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-23 10:16:51 UTC (rev 24517)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-12-23 10:21:07 UTC (rev 24518)
@@ -125,7 +125,7 @@
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
 endif
-ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED)),)
+ifneq ($(BR2_ENABLE_LOCALE_PREGENERATED),)
 	cp -dpf $(DL_DIR)/$(UCLIBC_SOURCE_LOCALE) $(UCLIBC_DIR)/extra/locale/
 endif
 	touch $@
