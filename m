From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Dec 2008 10:03:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081217180330.3BC463C2BF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-17 10:03:29 -0800 (Wed, 17 Dec 2008)
New Revision: 24441

Log:
Update to latest linux versions

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-12-17 16:01:39 UTC (rev 24440)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-12-17 18:03:29 UTC (rev 24441)
@@ -32,7 +32,7 @@
 # --- These 'constants' requires regular maintenance, so put them first
 config BR2_KERNEL_PATCH_LEVEL
 	string
-	default "7" if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
+	default "9" if BR2_LINUX_2_6_27 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "8" if BR2_LINUX_2_6_26 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "9" if BR2_LINUX_2_6_25 && BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default "7" if BR2_LINUX_2_6_24 && BR2_KERNEL_ADD_LATEST_MINORPATCH
@@ -44,7 +44,7 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.27.7"
+	default "2.6.27.9"
 
 config BR2_KERNEL_NEXT_VERSION
 	string
@@ -73,11 +73,11 @@
 
 config LINUX26_LATEST_RC_VERSION
 	string
-	default "2.6.28-rc6" if BR2_KERNEL_ADD_LATEST_RC_PATCH
+	default "2.6.28-rc8" if BR2_KERNEL_ADD_LATEST_RC_PATCH
 
 config LINUX26_LATEST_GIT_VERSION
 	string
-	default "2.6.28-rc6-git1" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
+	default "2.6.28-rc6-git4" if BR2_KERNEL_ADD_LATEST_SNAPSHOT
 
 config LINUX26_LATEST_MM_VERSION
 	string
@@ -139,9 +139,9 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.27.7)"
+	bool "The latest stable Linux kernel (2.6.27.9)"
 	help
-	  Linux 2.6.27.7
+	  Linux 2.6.27.9
 
 config BR2_LINUX_2_6_27
 	bool "Linux 2.6.27"
