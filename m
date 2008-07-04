From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 15:23:20 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk100x
Message-ID: <20080704222320.EF4F23C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 15:23:20 -0700 (Fri, 04 Jul 2008)
New Revision: 22639

Log:
Update atstk100x defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-07-04 22:18:56 UTC (rev 22638)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-07-04 22:23:20 UTC (rev 22639)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Jul  4 12:51:33 2008
+# Sat Jul  5 00:11:52 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -788,7 +788,7 @@
 # bootloader for target device
 #
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
+BR2_TARGET_UBOOT_BOARDNAME="atstk1002"
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
 BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
