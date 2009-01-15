From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 08:33:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090115083332.707F576850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-15 08:33:31 +0000 (Thu, 15 Jan 2009)
New Revision: 24853

Log:
kernel-headers: bump 2.6.27 version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-15 06:28:05 UTC (rev 24852)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-15 08:33:31 UTC (rev 24853)
@@ -116,7 +116,7 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.10"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.11"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
