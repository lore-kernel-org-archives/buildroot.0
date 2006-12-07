From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  6 Dec 2006 20:49:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061207044906.A477F48583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2006-12-06 20:49:05 -0800 (Wed, 06 Dec 2006)
New Revision: 16795

Log:
Update to newer snapshot.


Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2006-12-06 23:14:31 UTC (rev 16794)
+++ trunk/buildroot/toolchain/gcc/Config.in	2006-12-07 04:49:05 UTC (rev 16795)
@@ -68,7 +68,7 @@
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "20060408"
+	default "20061121"
 	depends BR2_GCC_IS_SNAP
 	help
 	  Enter snapshot date to use for gcc.  Format is:
