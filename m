From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 21:19:06 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20090126211906.8B9B57672B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 21:19:05 +0000 (Mon, 26 Jan 2009)
New Revision: 25070

Log:
Update at91sam9260dfc BSP

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-01-26 21:10:11 UTC (rev 25069)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2009-01-26 21:19:05 UTC (rev 25070)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Sat Jan 24 08:07:54 2009
+# Mon Jan 26 13:16:32 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="2009.02-svn"
@@ -243,7 +243,7 @@
 BR2_KERNEL_HEADERS_2_6_27=y
 # BR2_KERNEL_HEADERS_2_6_28 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.27.12"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.27.13"
 
 #
 # uClibc Options
@@ -415,7 +415,6 @@
 BR2_PACKAGE_LIBDAEMON=y
 # BR2_PACKAGE_LIBELF is not set
 BR2_PACKAGE_LIBEVENT=y
-# BR2_PACKAGE_LIBFLOAT is not set
 BR2_PACKAGE_LIBGCRYPT=y
 BR2_PACKAGE_LIBGPG_ERROR=y
 BR2_PACKAGE_LIBICONV=y
@@ -428,7 +427,6 @@
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
 # BR2_PACKAGE_LTRACE is not set
-# BR2_PACKAGE_LTT is not set
 # BR2_PACKAGE_MEMSTAT is not set
 # BR2_PACKAGE_NG_SPICE_REWORK is not set
 # BR2_PACKAGE_POPT is not set
@@ -679,7 +677,6 @@
 BR2_PACKAGE_USBMOUNT=y
 BR2_PACKAGE_USBUTILS=y
 # BR2_PACKAGE_WIPE is not set
-# BR2_PACKAGE_XFSPROGS is not set
 
 #
 # Audio and video libraries and applications
@@ -772,10 +769,6 @@
 # BR2_PACKAGE_LIBERATION is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
 BR2_PACKAGE_LIBGLIB2=y
-
-#
-# libsexy       - disabled (requires X-Windows)
-#
 # BR2_PACKAGE_OPENMOTIF is not set
 # BR2_PACKAGE_FONTCONFIG is not set
 # BR2_PACKAGE_FREETYPE is not set
@@ -995,11 +988,11 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-$(BR2_LINUX26_VERSION).config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.28.1"
-BR2_KERNEL_LATEST_2_6_28="1"
-BR2_KERNEL_LATEST_2_6_27="12"
+BR2_KERNEL_CURRENT_VERSION="2.6.28.2"
+BR2_KERNEL_LATEST_2_6_28="2"
+BR2_KERNEL_LATEST_2_6_27="13"
 BR2_KERNEL_LATEST_2_6_26="8"
-BR2_KERNEL_LATEST_2_6_25="9"
+BR2_KERNEL_LATEST_2_6_25="19"
 BR2_KERNEL_LATEST_2_6_24="7"
 BR2_KERNEL_LATEST_2_6_23="17"
 BR2_KERNEL_LATEST_2_6_22="19"
