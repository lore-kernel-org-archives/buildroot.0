From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 13 Dec 2007 04:15:50 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20071213121550.BD09F1200F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-13 04:15:48 -0800 (Thu, 13 Dec 2007)
New Revision: 20647

Log:
bump up syslinux version

Modified:
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-12-13 12:09:56 UTC (rev 20646)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2007-12-13 12:15:48 UTC (rev 20647)
@@ -22,7 +22,7 @@
 #
 #############################################################
 
-SYSLINUX_VERSION:=3.51
+SYSLINUX_VERSION:=3.53
 SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
