From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 23:22:28 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20090129232228.C9B5D7741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 23:22:27 +0000 (Thu, 29 Jan 2009)
New Revision: 25153

Log:
Update some comments, which will cause defconfig to wait for input

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-01-29 23:02:41 UTC (rev 25152)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-01-29 23:22:27 UTC (rev 25153)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Thu Jan 29 22:40:21 2009
+# Fri Jan 30 00:14:05 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="2009.02-svn"
@@ -235,10 +235,10 @@
 # BR2_KERNEL_HEADERS_2_6_24 is not set
 # BR2_KERNEL_HEADERS_2_6_25 is not set
 # BR2_KERNEL_HEADERS_2_6_26 is not set
-BR2_KERNEL_HEADERS_2_6_27=y
-# BR2_KERNEL_HEADERS_2_6_28 is not set
+# BR2_KERNEL_HEADERS_2_6_27 is not set
+BR2_KERNEL_HEADERS_2_6_28=y
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.27.13"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.28.2"
 
 #
 # uClibc Options
@@ -1029,15 +1029,11 @@
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
