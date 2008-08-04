From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080804190724.A831A3C873@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:24 -0700 (Mon, 04 Aug 2008)
New Revision: 23019

Log:
kernel-headers: mark 2.6.24 as deprecated and 2.6.25 as recent

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-04 19:07:21 UTC (rev 23018)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-08-04 19:07:24 UTC (rev 23019)
@@ -77,10 +77,11 @@
 		bool "Linux 2.6.23.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_24
-		depends on BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "Linux 2.6.24.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_25
+		depends on BR2_RECENT
 		bool "Linux 2.6.25.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_26
