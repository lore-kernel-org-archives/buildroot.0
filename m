From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 10 Jul 2008 08:14:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080710151417.BDB233C67C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-10 08:14:17 -0700 (Thu, 10 Jul 2008)
New Revision: 22762

Log:
Fix comments regarding latest stable kernel

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-07-10 14:58:04 UTC (rev 22761)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-07-10 15:14:17 UTC (rev 22762)
@@ -133,9 +133,9 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.25.9)"
+	bool "The latest stable Linux kernel (2.6.25.10)"
 	help
-	  Linux 2.6.25.9
+	  Linux 2.6.25.10
 
 config BR2_LINUX_2_6_25
 	bool "Linux 2.6.25"
