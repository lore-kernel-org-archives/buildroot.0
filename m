From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Dec 2007 02:12:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20071214101216.4172E1200F1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-12-14 02:12:15 -0800 (Fri, 14 Dec 2007)
New Revision: 20650

Log:
Bumped version


Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-12-13 12:38:13 UTC (rev 20649)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-12-14 10:12:15 UTC (rev 20650)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.4.1
+SQLITE_VERSION:=3.5.3
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
