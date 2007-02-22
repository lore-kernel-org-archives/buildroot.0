From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 22 Feb 2007 04:00:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070222120016.1158C485C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-22 04:00:15 -0800 (Thu, 22 Feb 2007)
New Revision: 17951

Log:
Bumped version

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-02-22 08:53:20 UTC (rev 17950)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-02-22 12:00:15 UTC (rev 17951)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.12
+SQLITE_VERSION=3.3.13
 SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE=http://www.sqlite.org
 SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
