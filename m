From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  4 Jul 2007 22:13:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070705051347.7B3F4A6134@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-04 22:13:46 -0700 (Wed, 04 Jul 2007)
New Revision: 19001

Log:
Enable the option.


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-07-05 05:13:20 UTC (rev 19000)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-07-05 05:13:46 UTC (rev 19001)
@@ -111,9 +111,8 @@
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
-#	bool "Enable toolchain with --sysroot support"
-	bool
-	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 &&!BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !BR2_GCC_VERSION_4_1_2
+	bool "Enable toolchain with --sysroot support"
+	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6
 	default y
 	help
 	  Enables --sysroot=dir for binutils and gcc.
