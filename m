From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  5 Jan 2008 12:31:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20080105203140.DDDFC12C4C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-01-05 12:31:40 -0800 (Sat, 05 Jan 2008)
New Revision: 20801

Log:
sqlite: bumped version


Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-01-05 19:05:50 UTC (rev 20800)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-01-05 20:31:40 UTC (rev 20801)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION:=3.5.3
+SQLITE_VERSION:=3.5.4
 SQLITE_SOURCE:=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE:=http://www.sqlite.org
 SQLITE_DIR:=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
