From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 03:36:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20080704103618.4F1D33C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 03:36:18 -0700 (Fri, 04 Jul 2008)
New Revision: 22628

Log:
Update atngw100 defconfig

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-07-04 10:29:30 UTC (rev 22627)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-07-04 10:36:18 UTC (rev 22628)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Jul  4 07:58:19 2008
+# Fri Jul  4 12:01:17 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -170,8 +170,11 @@
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)"
 BR2_VENDOR_SUFFIX="-avr32"
+BR2_VENDOR_BINUTILS_RELEASE="-2.1.5"
+BR2_VENDOR_GCC_RELEASE="-2.1.5"
+BR2_VENDOR_UCLIBC_RELEASE="-2.1.5"
 BR2_VENDOR_GDB_RELEASE="-2.1.5"
-BR2_VENDOR_PATCH_DIR="target/device/Atmel/toolchain/avr32"
+BR2_VENDOR_PATCH_DIR="Atmel/avr32"
 # BR2_EXT_GCC_VERSION_4_1_2 is not set
 # BR2_EXT_GCC_VERSION_4_2_1 is not set
 BR2_EXT_GCC_VERSION_4_2_2=y
