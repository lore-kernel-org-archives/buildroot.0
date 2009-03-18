From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 11:27:29 +0000 (UTC)
Subject: [Buildroot] svn commit: [25713]
	trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090318112729.9093A76459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 11:27:29 +0000 (Wed, 18 Mar 2009)
New Revision: 25713

Log:
kernel-headers: bump 2.6.27.x version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-03-18 02:51:45 UTC (rev 25712)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-03-18 11:27:29 UTC (rev 25713)
@@ -61,7 +61,7 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.18"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.20"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.8"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
