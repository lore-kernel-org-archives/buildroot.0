From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 14:17:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database
Message-ID: <20080601211729.6B2CC3C5C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 14:17:28 -0700 (Sun, 01 Jun 2008)
New Revision: 22170

Log:
Change to menuconfig and make it right.


Modified:
   trunk/buildroot/package/database/Config.in


Changeset:
Modified: trunk/buildroot/package/database/Config.in
===================================================================
--- trunk/buildroot/package/database/Config.in	2008-06-01 21:01:14 UTC (rev 22169)
+++ trunk/buildroot/package/database/Config.in	2008-06-01 21:17:28 UTC (rev 22170)
@@ -1,5 +1,5 @@
-menuconfig "Database"
+menuconfig BR2_DATABASE_SUPPORT
+	bool "Database"
+	default n
 
 source "package/database/mysql_client/Config.in"
-
-endmenu
