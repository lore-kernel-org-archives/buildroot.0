From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 10 Oct 2008 01:25:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081010082515.5F6723C922@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-10 01:25:15 -0700 (Fri, 10 Oct 2008)
New Revision: 23649

Log:
kernel-headers: bump 2.6.25.x / 2.6.26.x versions

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-10-10 08:25:02 UTC (rev 23648)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-10-10 08:25:15 UTC (rev 23649)
@@ -112,8 +112,8 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
-	default "2.6.25.15"	if BR2_KERNEL_HEADERS_2_6_25
-	default "2.6.26.2"	if BR2_KERNEL_HEADERS_2_6_26
+	default "2.6.25.18"	if BR2_KERNEL_HEADERS_2_6_25
+	default "2.6.26.6"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
