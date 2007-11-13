From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue, 13 Nov 2007 02:01:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/netkitbase
Message-ID: <20071113100104.572E93006F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-13 02:00:59 -0800 (Tue, 13 Nov 2007)
New Revision: 20413

Log:
add BR2_INET_RPC dependency

Modified:
   trunk/buildroot/package/netkitbase/Config.in


Changeset:
Modified: trunk/buildroot/package/netkitbase/Config.in
===================================================================
--- trunk/buildroot/package/netkitbase/Config.in	2007-11-13 04:05:31 UTC (rev 20412)
+++ trunk/buildroot/package/netkitbase/Config.in	2007-11-13 10:00:59 UTC (rev 20413)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
+	select BR2_INET_RPC
 	default n
 	help
 	  Old-style inetd.
