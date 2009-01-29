From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 23:23:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	arch-arm at91sam9261ek
Message-ID: <20090129232352.209597741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 23:23:51 +0000 (Thu, 29 Jan 2009)
New Revision: 25154

Log:
Update some comments, which will cause defconfig to wait for input

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 23:22:27 UTC (rev 25153)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 23:23:51 UTC (rev 25154)
@@ -8,7 +8,6 @@
 	default BR2_ARCH_AT91_2_6_25		if BR2_LINUX_2_6_25
 	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_24
 	default BR2_ARCH_AT91_2_6_22		if BR2_LINUX_2_6_22
-	default BR2_ARCH_AT91_2_6_28
 	help
 	  Select a patch to add to the Linux kernel
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2009-01-29 23:22:27 UTC (rev 25153)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2009-01-29 23:23:51 UTC (rev 25154)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 29 22:51:17 2009
+# Fri Jan 30 00:18:55 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="2009.02-svn"
@@ -1080,15 +1080,11 @@
 BR2_KERNEL_MINORLEVEL="2"
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
 BR2_ARCH_AT91_2_6_28=y
-# BR2_ARCH_AT91_2_6_27_7 is not set
+# BR2_ARCH_AT91_2_6_27 is not set
 # BR2_ARCH_AT91_2_6_26 is not set
-# BR2_ARCH_AT91_2_6_26_RC3 is not set
 # BR2_ARCH_AT91_2_6_25 is not set
 # BR2_ARCH_AT91_2_6_24 is not set
-# BR2_ARCH_AT91_2_6_22_1 is not set
-# BR2_ARCH_AT91_2_6_21_5 is not set
-# BR2_ARCH_AT91_2_6_21_1 is not set
-# BR2_ARCH_AT91_2_6_20_4 is not set
+# BR2_ARCH_AT91_2_6_22 is not set
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
