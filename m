From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  4 Apr 2008 00:24:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20080404072417.1A62B3C39D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-04 00:24:15 -0700 (Fri, 04 Apr 2008)
New Revision: 21633

Log:
kernel: default to not build a kernel


Modified:
   trunk/buildroot/target/Config.in


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2008-04-04 07:17:34 UTC (rev 21632)
+++ trunk/buildroot/target/Config.in	2008-04-04 07:24:15 UTC (rev 21633)
@@ -27,7 +27,7 @@
 choice
 	prompt "Kernel type"
 	default BR2_KERNEL_LINUX_ADVANCED if BR2_TARGET_ATMEL
-	default BR2_KERNEL_LINUX if !BR2_TARGET_ATMEL
+	default BR2_KERNEL_none if !BR2_TARGET_ATMEL
 
 config BR2_KERNEL_none
 	bool "none"
