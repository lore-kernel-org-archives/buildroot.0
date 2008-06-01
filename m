From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 12:28:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database:
	mysql_client
Message-ID: <20080601192845.BA4293C84C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 12:28:44 -0700 (Sun, 01 Jun 2008)
New Revision: 22166

Log:
Cosmetic fixes


Modified:
   trunk/buildroot/package/database/Config.in
   trunk/buildroot/package/database/mysql_client/Config.in


Changeset:
Modified: trunk/buildroot/package/database/Config.in
===================================================================
--- trunk/buildroot/package/database/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
+++ trunk/buildroot/package/database/Config.in	2008-06-01 19:28:44 UTC (rev 22166)
@@ -1,4 +1,4 @@
-menu "Database"
+menuconfig "Database"
 
 source "package/database/mysql_client/Config.in"
 

Modified: trunk/buildroot/package/database/mysql_client/Config.in
===================================================================
--- trunk/buildroot/package/database/mysql_client/Config.in	2008-06-01 18:08:48 UTC (rev 22165)
+++ trunk/buildroot/package/database/mysql_client/Config.in	2008-06-01 19:28:44 UTC (rev 22166)
@@ -2,4 +2,4 @@
 	bool "MySQL 5.1 client"
 	default n
 	help
-	  MySQL 5.1 client
+	  MySQL client
