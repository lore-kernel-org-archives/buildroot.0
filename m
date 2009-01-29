From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 21:17:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86
Message-ID: <20090129211739.359B276D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 21:17:36 +0000 (Thu, 29 Jan 2009)
New Revision: 25139

Log:
Remove default value from choice in x86 config

Modified:
   trunk/buildroot/target/device/x86/Config.in


Changeset:
Modified: trunk/buildroot/target/device/x86/Config.in
===================================================================
--- trunk/buildroot/target/device/x86/Config.in	2009-01-29 20:52:52 UTC (rev 25138)
+++ trunk/buildroot/target/device/x86/Config.in	2009-01-29 21:17:36 UTC (rev 25139)
@@ -11,7 +11,6 @@
 config BR2_TARGET_I686
 	bool "i686"
 	depends on BR2_i386
-	default y
 
 endchoice
 
