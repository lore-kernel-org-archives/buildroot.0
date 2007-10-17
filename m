From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Oct 2007 10:31:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20071017173118.F3A42A456F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-17 10:31:18 -0700 (Wed, 17 Oct 2007)
New Revision: 20275

Log:
fix typo in kernel headers

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-10-17 14:33:31 UTC (rev 20274)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-10-17 17:31:18 UTC (rev 20275)
@@ -130,6 +130,6 @@
 	default "2.6.22.1"	if BR2_KERNEL_HEADERS_2_6_22_1
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22_10
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
-	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_22
+	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
