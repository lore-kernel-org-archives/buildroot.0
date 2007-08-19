From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 11:26:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070819182633.110C4A4596@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 11:26:31 -0700 (Sun, 19 Aug 2007)
New Revision: 19560

Log:
Update AVR32 tools download location

Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-08-19 13:42:08 UTC (rev 19559)
+++ trunk/buildroot/target/device/Toolchain.in	2007-08-19 18:26:31 UTC (rev 19560)
@@ -30,7 +30,7 @@
 
 config BR2_VENDOR_SITE
 	string
-	default $(BR2_ATMEL_MIRROR) if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "$(BR2_ATMEL_MIRROR)/Source" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_SUFFIX
 	string
