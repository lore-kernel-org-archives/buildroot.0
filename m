From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Sep 2008 14:16:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
Message-ID: <20080901211636.6E3D23C6DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-01 14:16:35 -0700 (Mon, 01 Sep 2008)
New Revision: 23299

Log:
cups: fix help text

Modified:
   trunk/buildroot/package/cups/Config.in


Changeset:
Modified: trunk/buildroot/package/cups/Config.in
===================================================================
--- trunk/buildroot/package/cups/Config.in	2008-09-01 15:33:17 UTC (rev 23298)
+++ trunk/buildroot/package/cups/Config.in	2008-09-01 21:16:35 UTC (rev 23299)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_CUPS
 	bool "cups"
 	help
-		The Common Unix Print Subsystem
+	  The Common Unix Print Subsystem
 
-		http://www.cups.org
-
+	  http://www.cups.org
