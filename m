From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun,  6 Apr 2008 03:32:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080406103235.21B843C40B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-04-06 03:32:34 -0700 (Sun, 06 Apr 2008)
New Revision: 21653

Log:
Use lower case

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:30:18 UTC (rev 21652)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-04-06 10:32:34 UTC (rev 21653)
@@ -445,7 +445,7 @@
 
 choice
 	prompt "Preferred config tool"
-	default BR2_MAKE_XCONFIG IF BR2_TARGET_ATMEL
+	default BR2_MAKE_XCONFIG if BR2_TARGET_ATMEL
 	default BR2_MAKE_MENUCONFIG
 	help
 	  Define the preferred tool to invoke if a configuration is invalid
@@ -453,7 +453,7 @@
 config	BR2_MAKE_XCONFIG
 	bool "make xconfig"
 	help
-	  Run "make menuconfig" if kernel ".config" is invalid
+	  Run "make xconfig" if kernel ".config" is invalid
 
 config	BR2_MAKE_MENUCONFIG
 	bool "make menuconfig"
