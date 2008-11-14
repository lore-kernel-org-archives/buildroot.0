From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 02:06:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20081114100645.192BD3C8EE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-14 02:06:44 -0800 (Fri, 14 Nov 2008)
New Revision: 24037

Log:
target/Config.in.toolchain: cleanup

Modified:
   trunk/buildroot/target/device/Config.in.toolchain


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-11-14 08:47:04 UTC (rev 24036)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-11-14 10:06:44 UTC (rev 24037)
@@ -156,35 +156,33 @@
 
 config	BR2_EXT_GCC_VERSION_4_1_2
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
 config	BR2_EXT_GCC_VERSION_4_2_1
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
 config	BR2_EXT_GCC_VERSION_4_2_2
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
 config	BR2_EXT_GCC_VERSION_4_2_3
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
 config	BR2_EXT_BINUTILS_VERSION_2_17
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
+config	BR2_EXT_UCLIBC_VERSION_0_9_28_3
+	bool
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
 config	BR2_EXT_UCLIBC_VERSION_0_9_29
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
-config	BR2_EXT_UCLIBC_VERSION_0_9_28_3
+config	BR2_EXT_UCLIBC_VERSION_0_9_30
 	bool
-	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
