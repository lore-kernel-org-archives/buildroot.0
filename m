From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:28:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20080531072818.0440F3C8E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:28:17 -0700 (Sat, 31 May 2008)
New Revision: 22140

Log:
sqlite: bump version


Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-05-31 07:28:12 UTC (rev 22139)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-05-31 07:28:17 UTC (rev 22140)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.5.8
+SQLITE_VERSION:=3.5.9
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
