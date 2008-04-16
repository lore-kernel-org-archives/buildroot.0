From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 16 Apr 2008 16:00:58 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9261ek
Message-ID: <20080416230058.712DF3C62D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-16 16:00:58 -0700 (Wed, 16 Apr 2008)
New Revision: 21749

Log:
Update at91sam9261ek defconfig

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-04-16 22:54:46 UTC (rev 21748)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-04-16 23:00:58 UTC (rev 21749)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sun Mar 30 22:35:26 2008
+# Thu Apr 17 00:50:05 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -65,24 +65,47 @@
 # Atmel AT91 Specific Device Support
 #
 BR2_TARGET_AT91=y
+
+#
+# Selection criteria
+#
+BR2_TARGET_ATMEL_ALL=y
+
+#
+# Device Selection
+#
 # BR2_TARGET_AT91RM9200 is not set
 # BR2_TARGET_AT91SAM9260 is not set
-# BR2_TARGET_AT91SAM9260A is not set
+# BR2_TARGET_AT91SAM9G20 is not set
 BR2_TARGET_AT91SAM9261=y
 # BR2_TARGET_AT91SAM9261S is not set
-# BR2_TARGET_AT91SAM9262 is not set
+# BR2_TARGET_AT91SAM9RL64 is not set
 # BR2_TARGET_AT91SAM9263 is not set
+# BR2_TARGET_AT91SAM9G41 is not set
+# BR2_TARGET_AT91SAM9M10 is not set
+# BR2_TARGET_AT91SAM9M11 is not set
 # BR2_TARGET_AT91SAM9XE is not set
+# BR2_TARGET_AT572D940HF is not set
+# BR2_TARGET_AT91CAP9 is not set
+# BR2_TARGET_AT91SAM9262 is not set
+
+#
+# Development Board Selection
+#
 # BR2_TARGET_AT91RM9200DF is not set
 # BR2_TARGET_AT91RM9200SE is not set
 # BR2_TARGET_AT91RM9200EK is not set
 # BR2_TARGET_AT91RM9200DK is not set
 # BR2_TARGET_AT91SAM9260DFC is not set
 # BR2_TARGET_AT91SAM9260EK is not set
+# BR2_TARGET_AT91SAM9XEEK is not set
 BR2_TARGET_AT91SAM9261EK=y
+# BR2_TARGET_AT91SAM9RL64EK is not set
 # BR2_TARGET_AT91SAM9262EK is not set
 # BR2_TARGET_AT91SAM9263EK is not set
-# BR2_TARGET_AT91SAM9XEEK is not set
+# BR2_TARGET_AT572D940DCM is not set
+# BR2_TARGET_AT91CAP9DK is not set
+# BR2_TARGET_AT91CAP9STK is not set
 BR2_TARGET_AT91SAM9261EK_SPIMODE0=y
 # BR2_TARGET_AT91SAM9261EK_SPIMODE3 is not set
 BR2_BOARD_NAME="at91sam9261ek"
@@ -111,6 +134,15 @@
 # BR2_TARGET_AT91BOOT_NANDFLASH is not set
 # BR2_TARGET_AT91BOOT_FLASH is not set
 BR2_TARGET_AT91BOOTSTRAP_MEMORY="dataflash"
+BR2_AT91BOOTSTRAP_IMG_SIZE="0x32000"
+BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT=y
+# BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM is not set
+# BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM is not set
+BR2_AT91BOOTSTRAP_JUMP_ADDR="0x23F00000"
+
+#
+# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
+#
 # BR2_TARGET_SHARP is not set
 
 #
@@ -166,10 +198,10 @@
 # BR2_STRIP_sstrip is not set
 # BR2_STRIP_none is not set
 # BR2_OPTIMIZE_0 is not set
-BR2_OPTIMIZE_1=y
+# BR2_OPTIMIZE_1 is not set
 # BR2_OPTIMIZE_2 is not set
 # BR2_OPTIMIZE_3 is not set
-# BR2_OPTIMIZE_S is not set
+BR2_OPTIMIZE_S=y
 # BR2_PREFER_STATIC_LIB is not set
 # BR2_HAVE_MANPAGES is not set
 # BR2_HAVE_INFOPAGES is not set
@@ -343,6 +375,7 @@
 # Other stuff
 #
 # BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_BEECRYPT is not set
 # BR2_PACKAGE_BERKELEYDB is not set
 # BR2_PACKAGE_BSDIFF is not set
 # BR2_PACKAGE_CUPS is not set
@@ -367,6 +400,7 @@
 # BR2_PACKAGE_LTRACE is not set
 # BR2_PACKAGE_LTT is not set
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
+# BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_SQLITE is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
@@ -414,6 +448,7 @@
 # BR2_PACKAGE_MUTT is not set
 # BR2_PACKAGE_NBD is not set
 # BR2_PACKAGE_NCFTP is not set
+# BR2_PACKAGE_NEON is not set
 # BR2_PACKAGE_NETKITBASE is not set
 # BR2_PACKAGE_NETKITTELNET is not set
 # BR2_PACKAGE_NETPLUG is not set
@@ -475,6 +510,7 @@
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
 # BR2_PACKAGE_IOSTAT is not set
 # BR2_PACKAGE_LIBAIO is not set
 # BR2_PACKAGE_LIBRAW1394 is not set
@@ -512,6 +548,7 @@
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
 # BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_FESTIVAL is not set
 BR2_GRAPHIC_SUPPORT=y
 
 #
@@ -532,6 +569,7 @@
 # BR2_PACKAGE_DIRECTFB is not set
 # BR2_PACKAGE_IMAGEMAGICK is not set
 # BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
 # BR2_PACKAGE_SDL is not set
@@ -674,10 +712,12 @@
 # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
 BR2_TARGET_ROOTFS_EXT2_COPYTO=""
 # BR2_TARGET_ROOTFS_JFFS2 is not set
+# BR2_TARGET_ROOTFS_UBIFS is not set
 # BR2_TARGET_ROOTFS_SQUASHFS is not set
 # BR2_TARGET_ROOTFS_TAR is not set
 # BR2_TARGET_ROOTFS_CPIO is not set
 # BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
 
 #
 # bootloader for target device
@@ -740,6 +780,7 @@
 BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
+BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
 # BR2_KERNEL_LATEST is not set
@@ -766,5 +807,5 @@
 #
 # BR2_LINUX_COPYTO_ROOTFS is not set
 BR2_LINUX_COPYTO_TFTPBOOT=y
-BR2_LINUX_COPYTO="/tftpboot"
+BR2_LINUX_COPYTO=""
 BR2_LINUX_COPY_CONFIGURATION=y
