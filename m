From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Jun 2008 06:05:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080611130523.CB85B3C654@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-11 06:05:23 -0700 (Wed, 11 Jun 2008)
New Revision: 22291

Log:
kernel headers: bump 2.6.25.x version


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-11 12:12:40 UTC (rev 22290)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-11 13:05:23 UTC (rev 22291)
@@ -137,6 +137,6 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
-	default "2.6.25.5"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.25.6"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
