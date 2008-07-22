From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 06:59:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
Message-ID: <20080722135936.23DC43C70D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 06:59:35 -0700 (Tue, 22 Jul 2008)
New Revision: 22913

Log:
which: needs readline

Patch by Wade Berrier.

Modified:
   trunk/buildroot/package/which/Config.in


Changeset:
Modified: trunk/buildroot/package/which/Config.in
===================================================================
--- trunk/buildroot/package/which/Config.in	2008-07-22 11:37:23 UTC (rev 22912)
+++ trunk/buildroot/package/which/Config.in	2008-07-22 13:59:35 UTC (rev 22913)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WHICH
 	bool "which"
+	select BR2_READLINE
 	help
 	  The standard 'which' utility.
 
