From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Jun 2008 05:25:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080602122517.E077B3C8AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-02 05:25:17 -0700 (Mon, 02 Jun 2008)
New Revision: 22179

Log:
kernel headers: bump 2.6.24.x to 2.6.24.7


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-02 11:01:40 UTC (rev 22178)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-06-02 12:25:17 UTC (rev 22179)
@@ -130,6 +130,6 @@
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22_10
 	default "2.6.22.10"	if BR2_KERNEL_HEADERS_2_6_22
 	default "2.6.23"	if BR2_KERNEL_HEADERS_2_6_23
-	default "2.6.24"	if BR2_KERNEL_HEADERS_2_6_24
+	default "2.6.24.7"	if BR2_KERNEL_HEADERS_2_6_24
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
