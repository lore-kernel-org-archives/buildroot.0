From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 11:37:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20071013183725.4E5DFA45E1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 11:37:24 -0700 (Sat, 13 Oct 2007)
New Revision: 20243

Log:
Move config item deeper into menu system

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2007-10-13 18:30:28 UTC (rev 20242)
+++ trunk/buildroot/target/linux/Config.in.advanced	2007-10-13 18:37:24 UTC (rev 20243)
@@ -487,8 +487,6 @@
 	help
 	  Copy kernel to secondary location
 
-endmenu
-
 config BR2_LINUX_COPY_CONFIGURATION
 	bool "Copy buildroot configuration to Linux file system"
 	default y if BR2_TARGET_ATMEL
@@ -497,5 +495,6 @@
 	  The configuration files for buildroot, uclibc, busybox and linux
 	  are copied to the "<root>/boot" directory.
 
+endmenu
 endif
 
