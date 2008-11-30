From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Nov 2008 01:52:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081130095206.635543C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-30 01:52:06 -0800 (Sun, 30 Nov 2008)
New Revision: 24194

Log:
kernel-headers: bump 2.6.26.x / 2.6.27.x version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-11-30 09:51:57 UTC (rev 24193)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-11-30 09:52:06 UTC (rev 24194)
@@ -113,7 +113,7 @@
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
-	default "2.6.26.7"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.4"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
+	default "2.6.27.7"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
