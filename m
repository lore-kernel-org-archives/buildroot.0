From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 10 Dec 2008 15:54:18 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081210235418.B2B3A3C767@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-10 15:54:18 -0800 (Wed, 10 Dec 2008)
New Revision: 24364

Log:
toolchain/kernel-headers: don't hide 2.6.27 if RECENT isn't enabled

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-10 22:41:30 UTC (rev 24363)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-12-10 23:54:18 UTC (rev 24364)
@@ -65,7 +65,6 @@
 		bool "Linux 2.6.26.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_27
-		depends on BR2_RECENT
 		bool "Linux 2.6.27.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_SNAP
