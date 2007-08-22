From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 00:53:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070822075320.77B06A45EE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 00:53:18 -0700 (Wed, 22 Aug 2007)
New Revision: 19632

Log:
- fix wrong help-text


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-21 20:14:23 UTC (rev 19631)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-22 07:53:18 UTC (rev 19632)
@@ -63,11 +63,8 @@
 	default n
 	depends BR2_KERNEL_HEADERS_2_6_20 || BR2_KERNEL_HEADERS_2_6_21 || BR2_KERNEL_HEADERS_2_6_22
 	help
-	  Apply patches which allow for lzma compressed
-	  initramfs filesystems.  This requires the lzma
-	  program in your development environment.
+	  Apply patches which add IPMI sensor support.
 
-
 config BR2_KERNEL_HEADERS_LZMA
 	bool "use lzma initramfs kernel patches"
 	default n
