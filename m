From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Sep 2008 03:37:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database/sqlite
Message-ID: <20080905103729.17F163C651@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-05 03:37:28 -0700 (Fri, 05 Sep 2008)
New Revision: 23327

Log:
sqlite: bump version

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2008-09-05 04:59:02 UTC (rev 23326)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2008-09-05 10:37:28 UTC (rev 23327)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.6.1
+SQLITE_VERSION:=3.6.2
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
