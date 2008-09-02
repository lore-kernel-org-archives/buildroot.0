From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Sep 2008 04:14:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
Message-ID: <20080902111405.261FB3C674@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-02 04:14:04 -0700 (Tue, 02 Sep 2008)
New Revision: 23304

Log:
cups: fix help text

Modified:
   trunk/buildroot/package/cups/Config.in


Changeset:
Modified: trunk/buildroot/package/cups/Config.in
===================================================================
--- trunk/buildroot/package/cups/Config.in	2008-09-02 11:07:55 UTC (rev 23303)
+++ trunk/buildroot/package/cups/Config.in	2008-09-02 11:14:04 UTC (rev 23304)
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_CUPS
 	bool "cups"
 	help
-	  The Common Unix Print Subsystem
+	  The Common Unix Printing System
 
 	  http://www.cups.org
