From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 15 Apr 2007 02:51:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070415095131.9B5A348577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-15 02:51:28 -0700 (Sun, 15 Apr 2007)
New Revision: 18450

Log:
- recommend linuxthreads.old


Modified:
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-04-15 08:43:23 UTC (rev 18449)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-04-15 09:51:28 UTC (rev 18450)
@@ -40,6 +40,9 @@
 	default BR2_PTHREADS_OLD
 	help
 	  Select the version of libpthreads you want to use.
+	  Not all thread variants work with all versions of uClibc,
+	  the "linuxthreads (stable/old)" may be a working fallback
+	  if you need threading at all.
 
 	config BR2_PTHREADS_NONE
 		bool "none"
