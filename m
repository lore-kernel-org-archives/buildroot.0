From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 19 Jan 2009 12:34:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090119123435.50DCF7744F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-19 12:34:33 +0000 (Mon, 19 Jan 2009)
New Revision: 24908

Log:
toolchain/kernel-headers: bump 2.6.27 / 2.6.28 versions

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-19 09:18:46 UTC (rev 24907)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-19 12:34:33 UTC (rev 24908)
@@ -117,7 +117,7 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.11"	if BR2_KERNEL_HEADERS_2_6_27
-	default "2.6.28"	if BR2_KERNEL_HEADERS_2_6_28
+	default "2.6.27.12"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.28.1"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
