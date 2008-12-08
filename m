From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 05:05:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081208130548.3F87E3C6BF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 05:05:47 -0800 (Mon, 08 Dec 2008)
New Revision: 24316

Log:
toolchain/kernel-headers: bump 2.6.27.x version

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-08 09:07:01 UTC (rev 24315)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-08 13:05:47 UTC (rev 24316)
@@ -114,6 +114,6 @@
 	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
-	default "2.6.27.7"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.8"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
