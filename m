From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 13:50:46 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081228135046.2BC9E76D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 13:50:45 +0000 (Sun, 28 Dec 2008)
New Revision: 24574

Log:
toolchain/kernel-headers: add 2.6.28

Don't make it default yet as uclibc/busybox seems to have some issues
with it.

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-28 12:06:15 UTC (rev 24573)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-28 13:50:45 UTC (rev 24574)
@@ -67,6 +67,9 @@
 	config BR2_KERNEL_HEADERS_2_6_27
 		bool "Linux 2.6.27.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_28
+		bool "Linux 2.6.28.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
 
@@ -114,5 +117,6 @@
 	default "2.6.25.19"	if BR2_KERNEL_HEADERS_2_6_25
 	default "2.6.26.8"	if BR2_KERNEL_HEADERS_2_6_26
 	default "2.6.27.8"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.28"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 
