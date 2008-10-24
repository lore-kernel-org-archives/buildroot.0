From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 24 Oct 2008 04:02:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081024110233.403C03C2C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-24 04:02:32 -0700 (Fri, 24 Oct 2008)
New Revision: 23778

Log:
kernel-headers: bump 2.6.25, 2.6.26 and 2.6.27 minor versions

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-10-24 10:49:49 UTC (rev 23777)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-10-24 11:02:32 UTC (rev 23778)
@@ -112,8 +112,8 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
-	default "2.6.25.18"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.6"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.3"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
