From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 05:40:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/procps
Message-ID: <20080824124033.1D0283C658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-24 05:40:32 -0700 (Sun, 24 Aug 2008)
New Revision: 23194

Log:
procps: needs WCHAR

Modified:
   trunk/buildroot/package/procps/Config.in


Changeset:
Modified: trunk/buildroot/package/procps/Config.in
===================================================================
--- trunk/buildroot/package/procps/Config.in	2008-08-24 07:48:22 UTC (rev 23193)
+++ trunk/buildroot/package/procps/Config.in	2008-08-24 12:40:32 UTC (rev 23194)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PROCPS
 	bool "procps"
 	select BR2_PACKAGE_NCURSES
+	depends on BR2_USE_WCHAR
 	help
 	  Standard informational utilities and process-handling tools.
 	  Provides things like kill, ps, uptime, free, top, etc...
