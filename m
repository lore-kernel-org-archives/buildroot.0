From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 23:27:01 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atngw100-expanded
Message-ID: <20080706062701.6705F3C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 23:27:00 -0700 (Sat, 05 Jul 2008)
New Revision: 22661

Log:
Update atngw100-expanded defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2008-07-06 06:25:06 UTC (rev 22660)
+++ trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2008-07-06 06:27:00 UTC (rev 22661)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Jul  4 12:38:47 2008
+# Sat Jul  5 07:59:56 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -969,7 +969,7 @@
 BR2_GAMES=y
 BR2_PACKAGE_LXDOOM=y
 BR2_PACKAGE_LXDOOM_WAD=y
-BR2_PACKAGE_ACE_OF_PENGUINS=y
+# BR2_PACKAGE_ACE_OF_PENGUINS is not set
 BR2_PACKAGE_GNUCHESS=y
 BR2_PACKAGE_XBOARD=y
 BR2_PACKAGE_RUBIX=y
@@ -1020,7 +1020,7 @@
 # bootloader for target device
 #
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="$(BOARD_NAME)"
+BR2_TARGET_UBOOT_BOARDNAME="atngw100"
 BR2_TARGET_UBOOT_CUSTOM_PATCH=""
 BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
 BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
