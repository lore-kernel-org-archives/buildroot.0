From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  5 Nov 2008 03:11:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081105111143.8249C3C844@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-05 03:11:43 -0800 (Wed, 05 Nov 2008)
New Revision: 23933

Log:
kernel-headers: bump 2.6.26 and 2.6.27 minor versions

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-11-05 10:41:31 UTC (rev 23932)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-11-05 11:11:43 UTC (rev 23933)
@@ -113,7 +113,7 @@
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
-	default "2.6.26.6"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.3"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.26.7"	if BR2_KERNEL_HEADERS_2_6_26
+	default "2.6.27.4"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
