From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Oct 2008 01:56:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database/sqlite
Message-ID: <20081021085616.129553C61F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-21 01:56:15 -0700 (Tue, 21 Oct 2008)
New Revision: 23749

Log:
sqlite: bump version

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2008-10-20 21:29:27 UTC (rev 23748)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2008-10-21 08:56:15 UTC (rev 23749)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.6.2
+SQLITE_VERSION:=3.6.4
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
