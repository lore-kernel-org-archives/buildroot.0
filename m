From: austinf at uclibc.org <austinf@uclibc.org>
Date: Wed, 15 Apr 2009 09:13:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [26102] trunk/buildroot/target
Message-ID: <20090415091322.9352176525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: austinf
Date: 2009-04-15 09:13:21 +0000 (Wed, 15 Apr 2009)
New Revision: 26102

Log:
unmark the sparc targets as broken, they build if you disable shared libgcc


Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-04-15 02:13:14 UTC (rev 26101)
+++ trunk/buildroot/target/Config.in.arch	2009-04-15 09:13:21 UTC (rev 26102)
@@ -39,10 +39,8 @@
 	bool "superh64"
 config BR2_sparc
 	bool "sparc"
-	depends on BROKEN # uclibc linker errors
 config BR2_sparc64
 	bool "sparc64"
-	depends on BROKEN # uclibc libm linker errors
 config BR2_x86_64
 	bool "x86_64"
 endchoice
