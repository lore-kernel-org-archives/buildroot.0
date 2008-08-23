From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 23 Aug 2008 06:08:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080823130832.24437F8010@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-23 06:08:31 -0700 (Sat, 23 Aug 2008)
New Revision: 23184

Log:
libxml2: point to homepage instead of ftp site in help

Modified:
   trunk/buildroot/package/libxml2/Config.in


Changeset:
Modified: trunk/buildroot/package/libxml2/Config.in
===================================================================
--- trunk/buildroot/package/libxml2/Config.in	2008-08-23 13:08:28 UTC (rev 23183)
+++ trunk/buildroot/package/libxml2/Config.in	2008-08-23 13:08:31 UTC (rev 23184)
@@ -2,4 +2,5 @@
 	bool "libxml2"
 	help
 	  XML C Parser
-	  ftp://xmlsoft.org/libxml2
+
+	  http://xmlsoft.org/
