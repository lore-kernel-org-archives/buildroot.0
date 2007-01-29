From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Jan 2007 07:45:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070129154505.F12C4485C9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-29 07:45:04 -0800 (Mon, 29 Jan 2007)
New Revision: 17635

Log:
bump version

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-01-29 14:56:56 UTC (rev 17634)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-01-29 15:45:04 UTC (rev 17635)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.10
+SQLITE_VERSION=3.3.12
 SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE=http://www.sqlite.org
 SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
