From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 30 Oct 2008 07:02:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081030140247.B0D3C3C6BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-30 07:02:47 -0700 (Thu, 30 Oct 2008)
New Revision: 23859

Log:
linux: fix typo in status printout

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:02:05 UTC (rev 23858)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:02:47 UTC (rev 23859)
@@ -499,7 +499,7 @@
 	@echo BR2_PACKAGE_LINUX_USE_XCONFIG=$(BR2_PACKAGE_LINUX_USE_XCONFIG)
 	@echo BR2_PACKAGE_LINUX_KCONFIG=$(BR2_PACKAGE_LINUX_KCONFIG)
 	@echo BR2_LINUX_COPYTO_ROOTFS=$(BR2_LINUX_COPYTO_ROOTFS)
-	@echo BR2_LINUX_COPYTO_TFTPBOOT=$(BR2_LINUX_COPYTO_TFTPBOOT=)
+	@echo BR2_LINUX_COPYTO_TFTPBOOT=$(BR2_LINUX_COPYTO_TFTPBOOT)
 	@echo BR2_LINUX_COPYTO=$(BR2_LINUX_COPYTO)
 	@echo LINUX_COPYTO=$(LINUX_COPYTO)
 	@echo BR2_KERNEL_MINORLEVEL=$(BR2_KERNEL_MINORLEVEL)
