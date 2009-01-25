From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:42:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090125234211.2DF5276D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:42:09 +0000 (Sun, 25 Jan 2009)
New Revision: 25031

Log:
Update patchlevels for linux-2.6.25/27/28

Modified:
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Config.in.versions


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-25 23:32:13 UTC (rev 25030)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-25 23:42:09 UTC (rev 25031)
@@ -127,7 +127,7 @@
 	  Select the specific Linux version you want to use
 
 config BR2_LINUX_2_6_STABLE
-	bool "The latest stable Linux kernel (2.6.28.1)"
+	bool "The latest stable Linux kernel (2.6.28.2)"
 
 config BR2_LINUX_2_6_28
 	bool "Linux 2.6.28"

Modified: trunk/buildroot/target/linux/Config.in.versions
===================================================================
--- trunk/buildroot/target/linux/Config.in.versions	2009-01-25 23:32:13 UTC (rev 25030)
+++ trunk/buildroot/target/linux/Config.in.versions	2009-01-25 23:42:09 UTC (rev 25031)
@@ -19,17 +19,17 @@
 
 config BR2_KERNEL_CURRENT_VERSION
 	string
-	default "2.6.28.1"
+	default "2.6.28.2"
 	help
 	  This is the latest stable kernel (including minor version)
 
 config BR2_KERNEL_LATEST_2_6_28
 	string
-	default "1"
+	default "2"
 
 config BR2_KERNEL_LATEST_2_6_27
 	string
-	default "12"
+	default "13"
 
 config BR2_KERNEL_LATEST_2_6_26
 	string
@@ -37,7 +37,7 @@
 
 config BR2_KERNEL_LATEST_2_6_25
 	string
-	default "9"
+	default "19"
 
 config BR2_KERNEL_LATEST_2_6_24
 	string
