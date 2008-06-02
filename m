From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Jun 2008 05:25:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080602122522.471AE3C8C7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-02 05:25:20 -0700 (Mon, 02 Jun 2008)
New Revision: 22180

Log:
kernel headers: add 2.6.25.4


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-02 12:25:17 UTC (rev 22179)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-02 12:25:20 UTC (rev 22180)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_24
+	default BR2_KERNEL_HEADERS_2_6_25
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -77,6 +77,9 @@
 	config BR2_KERNEL_HEADERS_2_6_24
 		bool "Linux 2.6.24.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_25
+		bool "Linux 2.6.25.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
 
@@ -131,5 +134,6 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
+	default "2.6.25.4"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
