From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  1 Oct 2007 14:16:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20071001211634.063E9A6823@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-01 14:16:33 -0700 (Mon, 01 Oct 2007)
New Revision: 20167

Log:
Update ATNGW100 defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-10-01 21:12:54 UTC (rev 20166)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2007-10-01 21:16:33 UTC (rev 20167)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sat Sep 29 22:36:38 2007
+# Mon Oct  1 23:15:43 2007
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -42,7 +42,6 @@
 #
 # Preset Devices
 #
-BR2_PACKAGE_LINUX=y
 BR2_TARGET_ATMEL=y
 
 #
@@ -97,7 +96,7 @@
 BR2_ZCAT="zcat"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="$(BASE_DIR)/src/dl"
+BR2_DL_DIR="$(BASE_DIR)/dl"
 
 #
 # Mirrors and Download locations
@@ -198,14 +197,13 @@
 BR2_GCC_VERSION_4_1_2=y
 # BR2_GCC_VERSION_4_2_0 is not set
 # BR2_GCC_VERSION_4_2_1 is not set
-BR2_GCC_SUPPORTS_SYSROOT=y
+# BR2_GCC_SUPPORTS_SYSROOT is not set
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.1.2"
-BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
-BR2_GCC_CROSS_CXX=y
-BR2_INSTALL_LIBSTDCPP=y
+# BR2_GCC_CROSS_CXX is not set
+# BR2_INSTALL_LIBSTDCPP is not set
 # BR2_GCC_SHARED_LIBGCC is not set
 
 #
@@ -247,6 +245,7 @@
 # BR2_BUSYBOX_VERSION_1_6_1 is not set
 # BR2_BUSYBOX_VERSION_1_7_0 is not set
 BR2_BUSYBOX_VERSION_1_7_1=y
+# BR2_BUSYBOX_VERSION_1_7_2 is not set
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
 BR2_BUSYBOX_VERSION="1.7.1"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
@@ -547,6 +546,7 @@
 # BR2_KERNEL_none is not set
 BR2_KERNEL_LINUX=y
 # BR2_KERNEL_HURD is not set
+BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
