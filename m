From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 30 Jan 2007 09:37:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070130173736.3817E485B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-30 09:37:35 -0800 (Tue, 30 Jan 2007)
New Revision: 17674

Log:
- set preferred kernel format to bzImage for i386 family


Modified:
   trunk/buildroot/target/device/x86/i386/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/i386/Makefile.in	2007-01-30 17:36:51 UTC (rev 17673)
+++ trunk/buildroot/target/device/x86/i386/Makefile.in	2007-01-30 17:37:35 UTC (rev 17674)
@@ -3,5 +3,6 @@
 ifndef LINUX26_KCONFIG
 LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
 endif
+LINUX26_FORMAT=bzImage
 
 TARGETS+=linux26
