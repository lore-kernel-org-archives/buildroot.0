From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 21:15:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20090111211508.B3E6076736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 21:15:08 +0000 (Sun, 11 Jan 2009)
New Revision: 24768

Log:
Update defocnfig for ngw100

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-11 21:14:17 UTC (rev 24767)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2009-01-11 21:15:08 UTC (rev 24768)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Tue Jan  6 23:24:27 2009
+# Sat Jan 10 02:15:06 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -764,13 +764,13 @@
 BR2_TARGET_UBOOT_2008_10=y
 # BR2_TARGET_UBOOT_1_3_4 is not set
 # BR2_TARGET_UBOOT_1_2_0_ATMEL is not set
-# BR2_TARGET_UBOOT_2009_01 is not set
 BR2_UBOOT_VERSION="2008.10"
 BR2_U_BOOT_SITE="ftp://ftp.denx.de/pub/u-boot"
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 # BR2_TARGET_UBOOT_SILENT is not set
 # BR2_TARGET_UBOOT_TOOL_MKIMAGE is not set
 # BR2_TARGET_UBOOT_TOOL_ENV is not set
+BR2_TARGET_UBOOT_DEFAULT_ENV=y
 BR2_TARGET_UBOOT_SDRAM_SIZE_256MB=y
 # BR2_TARGET_UBOOT_SDRAM_SIZE_128MB is not set
 # BR2_TARGET_UBOOT_SDRAM_SIZE_64MB is not set
@@ -784,17 +784,8 @@
 BR2_TARGET_UBOOT_KERNEL_SIZE_2_00MB=y
 # BR2_TARGET_UBOOT_KERNEL_SIZE_2_25MB is not set
 # BR2_TARGET_UBOOT_KERNEL_SIZE_2_50MB is not set
-BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB=y
-# BR2_TARGET_UBOOT_DATAFLASH_SIZE_4MB is not set
-# BR2_TARGET_UBOOT_DATAFLASH_SIZE_2MB is not set
-# BR2_TARGET_UBOOT_DATAFLASH_SIZE_1MB is not set
-# BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_50MB is not set
-# BR2_TARGET_UBOOT_DATAFLASH_SIZE_0_25MB is not set
-BR2_TARGET_UBOOT_END_OF_FLASH="C083FFFF"
 BR2_TARGET_UBOOT_KERNEL_START="21000000"
-BR2_TARGET_UBOOT_KERNEL_LOCATION="C0042000"
 BR2_TARGET_UBOOT_FILESYSTEM_START="21210000"
-BR2_TARGET_UBOOT_FILESYSTEM_LOCATION="C0252000"
 BR2_TARGET_UBOOT_FILESYSTEM_SIZE="6000000"
 BR2_TARGET_UBOOT_NETWORK=y
 BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
