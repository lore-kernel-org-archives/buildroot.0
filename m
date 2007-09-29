From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Sep 2007 13:47:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070929204719.B5C7F30043@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-29 13:47:18 -0700 (Sat, 29 Sep 2007)
New Revision: 20127

Log:
Go back to gcc for avr32 rev 2.0

Modified:
   trunk/buildroot/target/device/Config.in.toolchain


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2007-09-29 20:44:30 UTC (rev 20126)
+++ trunk/buildroot/target/device/Config.in.toolchain	2007-09-29 20:47:18 UTC (rev 20127)
@@ -33,7 +33,7 @@
 
 config BR2_VENDOR_GCC_RELEASE
 	string
-	default "-2.2" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_UCLIBC_RELEASE
 	string
