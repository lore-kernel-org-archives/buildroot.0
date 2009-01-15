From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 15 Jan 2009 08:33:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20090115083336.7C6FA76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-15 08:33:35 +0000 (Thu, 15 Jan 2009)
New Revision: 24854

Log:
kernel-headers: default to 2.6.28

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-15 08:33:31 UTC (rev 24853)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2009-01-15 08:33:35 UTC (rev 24854)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_27
+	default BR2_KERNEL_HEADERS_2_6_28
 
 	help
 	  Select the version of kernel header files you wish to use.
