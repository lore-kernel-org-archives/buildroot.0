From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 31 Jul 2007 08:37:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070731153754.4875EA5E30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-31 08:37:53 -0700 (Tue, 31 Jul 2007)
New Revision: 19355

Log:
- FIXME: Bug Ulf to provide a helptext
- fixup erroneous whitespace that prevents this to fit into an 80x24 terminal


Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-07-31 15:10:55 UTC (rev 19354)
+++ trunk/buildroot/target/device/Toolchain.in	2007-07-31 15:37:53 UTC (rev 19355)
@@ -10,6 +10,8 @@
 config BR2_TOOLCHAIN_NORMAL
 	bool
 	prompt "Use default sources for toolchain"
+	help
+	  FIXME: Bug Ulf to provide a helptext
 
 config BR2_TOOLCHAIN_ATMEL_AVR32
 	bool
@@ -24,28 +26,28 @@
 
 config BR2_VENDOR_SITE
 	string
-	default $(BR2_ATMEL_MIRROR)			if BR2_TOOLCHAIN_ATMEL_AVR32
+	default $(BR2_ATMEL_MIRROR) if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_SUFFIX
 	string
-	default "-avr32"				if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_BINUTILS_RELEASE
 	string
-	default "-2.0"					if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_GCC_RELEASE
 	string
-	default "-2.0"					if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_UCLIBC_RELEASE
 	string
-	default "-2.0"					if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_GDB_RELEASE
 	string
-	default "-2.0"					if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_PATCH_DIR
 	string
-	default "target/device/Atmel/toolchain/avr32"	if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "target/device/Atmel/toolchain/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
