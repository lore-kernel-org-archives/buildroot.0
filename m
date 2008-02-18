From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Mon, 18 Feb 2008 14:10:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20080218221010.ABD49120128@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-02-18 14:10:05 -0800 (Mon, 18 Feb 2008)
New Revision: 21055

Log:
Upped version, the one here didn't exist any more. 3.61 compiled nicely (todo; check if nasm is installed on host?, syslinux needs it. Guess I copuld just add a target/host package.)


Modified:
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2008-02-18 21:08:49 UTC (rev 21054)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2008-02-18 22:10:05 UTC (rev 21055)
@@ -22,7 +22,7 @@
 #
 #############################################################
 
-SYSLINUX_VERSION:=3.53
+SYSLINUX_VERSION:=3.61
 SYSLINUX_DIR=$(BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_DIR2=$(TOOL_BUILD_DIR)/syslinux-$(SYSLINUX_VERSION)
 SYSLINUX_SOURCE=syslinux-$(SYSLINUX_VERSION).tar.bz2
