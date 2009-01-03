From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 16:25:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	toolchain/uClibc/ext_sourc etc...
Message-ID: <20090103162548.32E1076BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 16:25:47 +0000 (Sat, 03 Jan 2009)
New Revision: 24677

Log:
Allow use of uClibc-0.9.30 for AVR32 toolchain

Added:
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5/

Modified:
   trunk/buildroot/target/device/Config.in.toolchain


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2009-01-03 16:24:14 UTC (rev 24676)
+++ trunk/buildroot/target/device/Config.in.toolchain	2009-01-03 16:25:47 UTC (rev 24677)
@@ -57,13 +57,14 @@
 	select BR2_EXT_GCC_VERSION_4_2_2
 	select BR2_EXT_BINUTILS_VERSION_2_18
 	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_EXT_UCLIBC_VERSION_0_9_30
 	select BR2_TOOLCHAIN_ATMEL_AVR32
 	select BR2_GCC_SUPPORTS_SYSROOT
 	help
 	  The gcc-4.2.2 toolchain for the AVR32
 	  * gcc-4.2.2
 	  * binutils-2.18
-	  * uClibc-0.9.29
+	  * uClibc-0.9.29/30
 	  * gdb-6.7.1
 	  It is generated from buildroot-avr32-v2.3.0-rc1
 	  in http://www.atmel.no/buildroot
@@ -75,6 +76,7 @@
 	select BR2_EXT_GCC_VERSION_4_2_3
 	select BR2_EXT_BINUTILS_VERSION_2_17
 	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_EXT_UCLIBC_VERSION_0_9_30
 	select BR2_TOOLCHAIN_ATMEL_AVR32
 	help
 	  The gcc-4.2.3 toolchain for the AVR32
