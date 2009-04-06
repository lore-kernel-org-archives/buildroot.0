From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Apr 2009 09:21:30 +0000 (UTC)
Subject: [Buildroot] svn commit: [25976]
	trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090406092130.9072177182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-06 09:21:30 +0000 (Mon, 06 Apr 2009)
New Revision: 25976

Log:
kernel-headers: bump 2.6.29.x version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-04-06 09:21:26 UTC (rev 25975)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-04-06 09:21:30 UTC (rev 25976)
@@ -62,6 +62,6 @@
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.21"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.9"	if BR2_KERNEL_HEADERS_2_6_28
-	default "2.6.29"	if BR2_KERNEL_HEADERS_2_6_29
+	default "2.6.29.1"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
