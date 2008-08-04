From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080804190722.1E7033C86B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:21 -0700 (Mon, 04 Aug 2008)
New Revision: 23018

Log:
kernel-headers: add 2.6.26.x

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-04 19:07:18 UTC (rev 23017)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-04 19:07:21 UTC (rev 23018)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_25
+	default BR2_KERNEL_HEADERS_2_6_26
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -83,6 +83,9 @@
 	config BR2_KERNEL_HEADERS_2_6_25
 		bool "Linux 2.6.25.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_26
+		bool "Linux 2.6.26.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
 
@@ -134,5 +137,6 @@
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.10"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.26"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
