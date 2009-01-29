From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 19:49:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/database/sqlite
Message-ID: <20090129194923.5917476D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-29 19:49:22 +0000 (Thu, 29 Jan 2009)
New Revision: 25135

Log:
sqlite: bump version

Fixes several database corruption bugs

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2009-01-29 19:25:24 UTC (rev 25134)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2009-01-29 19:49:22 UTC (rev 25135)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.6.4
+SQLITE_VERSION:=3.6.10
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
