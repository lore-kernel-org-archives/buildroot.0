From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 21 Aug 2008 07:51:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database/sqlite
Message-ID: <20080821145114.D65AE3C3F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-21 07:51:14 -0700 (Thu, 21 Aug 2008)
New Revision: 23162

Log:
sqlite: bump version

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2008-08-21 14:37:14 UTC (rev 23161)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2008-08-21 14:51:14 UTC (rev 23162)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.5.9
+SQLITE_VERSION:=3.6.1
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
