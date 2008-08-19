From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Aug 2008 08:01:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080819150133.9B8373C85E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-19 08:01:33 -0700 (Tue, 19 Aug 2008)
New Revision: 23107

Log:
kernel-headers: bump 2.6.25.x / 2.6.26.x versions

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-19 11:28:52 UTC (rev 23106)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-19 15:01:33 UTC (rev 23107)
@@ -107,7 +107,7 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
-	default "2.6.25.10"	if BR2_KERNEL_HEADERS_2_6_25
-	default "2.6.26"	if BR2_KERNEL_HEADERS_2_6_26
+	default "2.6.25.15"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.26.2"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
