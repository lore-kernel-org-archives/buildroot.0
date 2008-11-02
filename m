From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Nov 2008 11:21:13 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20081102192113.61C573C91B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-02 11:21:12 -0800 (Sun, 02 Nov 2008)
New Revision: 23903

Log:
syslinux: fix download url

Modified:
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2008-11-02 13:06:44 UTC (rev 23902)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2008-11-02 19:21:12 UTC (rev 23903)
@@ -27,7 +27,7 @@
 SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
 SYSLINUX_CAT:=$(BZCAT)
-SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux
+SYSLINUX_SITE=$(BR2_KERNEL_MIRROR)/linux/utils/boot/syslinux/Old
 SYSLINUX_BIN=$(SYSLINUX_DIR2)/mtools/syslinux
 
 
