From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 10:32:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070919173222.56A79A6824@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 10:32:21 -0700 (Wed, 19 Sep 2007)
New Revision: 19894

Log:
- exclude other old, deprecated and unsupported versions of gcc


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-19 14:15:46 UTC (rev 19893)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-19 17:32:21 UTC (rev 19894)
@@ -119,7 +119,7 @@
 
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
-	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_1_2
+	depends on !BR2_GCC_VERSION_3_3_5 && !BR2_GCC_VERSION_3_3_6 && !BR2_GCC_VERSION_3_4_2 && !BR2_GCC_VERSION_3_4_3 && !BR2_GCC_VERSION_3_4_4 && !BR2_GCC_VERSION_3_4_5 && !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_0 && !BR2_GCC_VERSION_4_0_1 && !BR2_GCC_VERSION_4_0_2 && !BR2_GCC_VERSION_4_0_3 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_0 && !BR2_GCC_VERSION_4_1_1 && !!BR2_GCC_VERSION_4_1_2
 	default y
 	help
 	  Enables --sysroot=dir for binutils and gcc.
