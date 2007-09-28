From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 12:51:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device:
	Atmel/toolchain/avr32
Message-ID: <20070928195107.F050E3007B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 12:51:06 -0700 (Fri, 28 Sep 2007)
New Revision: 20091

Log:
Update AVR external gcc tarball to 2.2

Added:
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.2/

Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-09-28 19:49:13 UTC (rev 20090)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-28 19:51:06 UTC (rev 20091)
@@ -33,7 +33,7 @@
 
 config BR2_VENDOR_GCC_RELEASE
 	string
-	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.2" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_UCLIBC_RELEASE
 	string
