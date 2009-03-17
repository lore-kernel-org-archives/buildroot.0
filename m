From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 13:49:03 +0000 (UTC)
Subject: [Buildroot] svn commit: [25707]
	trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090317134903.D2F5076419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 13:49:03 +0000 (Tue, 17 Mar 2009)
New Revision: 25707

Log:
kernel-headers: bump 2.6.28.x version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-03-17 13:48:47 UTC (rev 25706)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-03-17 13:49:03 UTC (rev 25707)
@@ -62,6 +62,6 @@
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.18"	if BR2_KERNEL_HEADERS_2_6_27
-	default "2.6.28.7"	if BR2_KERNEL_HEADERS_2_6_28
+	default "2.6.28.8"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
