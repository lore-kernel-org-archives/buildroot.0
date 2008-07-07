From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  6 Jul 2008 22:30:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080707053023.471133C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-06 22:30:22 -0700 (Sun, 06 Jul 2008)
New Revision: 22670

Log:
kernel-headers: bump 2.6.25.x version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-07-07 05:08:39 UTC (rev 22669)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-07-07 05:30:22 UTC (rev 22670)
@@ -137,6 +137,6 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
-	default "2.6.25.9"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.25.10"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
