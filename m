From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Wed, 12 Mar 2008 06:11:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080312131129.9E0D512016B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-12 06:11:29 -0700 (Wed, 12 Mar 2008)
New Revision: 21314

Log:
one more minor change for debugging option

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-03-12 13:07:10 UTC (rev 21313)
+++ trunk/buildroot/Config.in	2008-03-12 13:11:29 UTC (rev 21314)
@@ -186,6 +186,7 @@
 
 config BR2_ENABLE_DEBUG
 	bool "build packages with debugging symbols"
+	select BR2_PACKAGE_GDB_SERVER
 	default n
 	help
 	  Build packages with debugging symbols
