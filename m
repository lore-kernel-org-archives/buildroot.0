From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Mar 2008 13:22:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080330202213.A764B3C4A6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-30 13:22:13 -0700 (Sun, 30 Mar 2008)
New Revision: 21582

Log:
linux advanced: make menuconfig default


Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-03-30 20:04:55 UTC (rev 21581)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-03-30 20:22:13 UTC (rev 21582)
@@ -437,7 +437,7 @@
 
 choice
 	prompt "Preferred config tool"
-	default BR2_MAKE_XCONFIG
+	default BR2_MAKE_MENUCONFIG
 	help
 	  Define the preferred tool to invoke if a configuration is invalid
 
