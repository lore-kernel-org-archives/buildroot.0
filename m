From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 08:43:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090115084334.C7CBB76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-15 08:43:33 +0000 (Thu, 15 Jan 2009)
New Revision: 24855

Log:
kernel-headers: mark 2.6.27 as RECENT, 2.6.26 as deprecated

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-15 08:33:35 UTC (rev 24854)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-15 08:43:33 UTC (rev 24855)
@@ -61,10 +61,11 @@
 		bool "Linux 2.6.25.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_26
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "Linux 2.6.26.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_27
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "Linux 2.6.27.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_28
