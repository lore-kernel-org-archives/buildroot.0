From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Mar 2009 09:29:10 +0000 (UTC)
Subject: [Buildroot] svn commit: [25825] trunk/buildroot/package/util-linux
Message-ID: <20090326092910.D2C4C76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-26 09:29:09 +0000 (Thu, 26 Mar 2009)
New Revision: 25825

Log:
util-linux: fix download URL

Modified:
   trunk/buildroot/package/util-linux/util-linux.mk


Changeset:
Modified: trunk/buildroot/package/util-linux/util-linux.mk
===================================================================
--- trunk/buildroot/package/util-linux/util-linux.mk	2009-03-26 08:51:47 UTC (rev 25824)
+++ trunk/buildroot/package/util-linux/util-linux.mk	2009-03-26 09:29:09 UTC (rev 25825)
@@ -5,7 +5,7 @@
 #############################################################
 UTIL-LINUX_VERSION:=2.13-pre7
 UTIL-LINUX_SOURCE:=util-linux-$(UTIL-LINUX_VERSION).tar.bz2
-UTIL-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux
+UTIL-LINUX_SITE:=$(BR2_KERNEL_MIRROR)/linux/utils/util-linux/testing
 UTIL-LINUX_DIR:=$(BUILD_DIR)/util-linux-$(UTIL-LINUX_VERSION)
 UTIL-LINUX_CAT:=$(BZCAT)
 UTIL-LINUX_BINARY:=$(UTIL-LINUX_DIR)/misc-utils/chkdupexe
