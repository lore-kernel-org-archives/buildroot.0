From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 15:22:56 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91rm9200df
Message-ID: <20070926222256.84564A5D37@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 15:22:55 -0700 (Wed, 26 Sep 2007)
New Revision: 20048

Log:
Use Makefile def of busybox config

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in	2007-09-26 22:12:51 UTC (rev 20047)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in	2007-09-26 22:22:55 UTC (rev 20048)
@@ -1,10 +1,10 @@
 ifeq ($(BOARD_NAME),at91rm9200df)
 LINUX_BOARD_NAME=at91rm9200ek
-BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.7.1.config
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.7.1.config
 endif
 
 
 ifeq ($(BOARD_NAME),at91rm9200ek)
-BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.7.1.config
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox-1.7.1.config
 endif
 

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2007-09-26 22:12:51 UTC (rev 20047)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2007-09-26 22:22:55 UTC (rev 20048)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Wed Sep 26 23:17:39 2007
+# Thu Sep 27 00:11:05 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -218,15 +218,15 @@
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
 BR2_BUSYBOX_VERSION="1.7.1"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG=""
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
 
 #
 # Skeleton configuration
 #
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
-BR2_HOSTNAME="AT91SAM9261EK"
-BR2_BANNER="Welcome to the AT91SAM9261EK"
+BR2_HOSTNAME="AT91RM9200DF"
+BR2_BANNER="Welcome to the AT91RM9200DF"
 
 #
 # The minimum needed to build a uClibc development system ---
@@ -753,8 +753,6 @@
 # BR2_TARGET_AT91SAM9262EK is not set
 # BR2_TARGET_AT91SAM9263EK is not set
 # BR2_TARGET_AT91SAM9XEEK is not set
-# BR2_TARGET_AT91SAM9261EK_SPIMODE0 is not set
-# BR2_TARGET_AT91SAM9261EK_SPIMODE3 is not set
 BR2_BOARD_NAME="at91rm9200df"
 BR2_TARGET_AT91_ADVANCED_INFO=y
 
@@ -778,13 +776,6 @@
 BR2_TARGET_DATAFLASHBOOT_AT91RM9200=y
 # BR2_TARGET_DATAFLASHBOOT_AT91SAM9261 is not set
 # BR2_TARGET_DATAFLASHBOOT_AT91SAM9261S is not set
-# BR2_TARGET_AT91BOOT_DATAFLASH is not set
-# BR2_TARGET_AT91BOOT_DATAFLASHCARD is not set
-# BR2_TARGET_AT91BOOT_NANDFLASH is not set
-# BR2_TARGET_AT91BOOT_FLASH is not set
-# BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT is not set
-# BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM is not set
-# BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM is not set
 
 #
 # It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
