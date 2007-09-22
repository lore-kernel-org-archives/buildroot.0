From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 09:40:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070922164008.B0D1AA612B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 09:40:08 -0700 (Sat, 22 Sep 2007)
New Revision: 19942

Log:
- default to 0.9.29


Modified:
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-09-22 16:37:00 UTC (rev 19941)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-09-22 16:40:08 UTC (rev 19942)
@@ -5,7 +5,7 @@
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_SNAPSHOT
+	default BR2_UCLIBC_VERSION_0_9_29
 	help
 	  Select the version of uClibc you wish to use.
 
