From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 18 Jan 2007 08:26:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sqlite
Message-ID: <20070118162643.CB68C4856C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-18 08:26:43 -0800 (Thu, 18 Jan 2007)
New Revision: 17367

Log:
Bump version

Modified:
   trunk/buildroot/package/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2007-01-18 16:23:53 UTC (rev 17366)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2007-01-18 16:26:43 UTC (rev 17367)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION=3.3.7
+SQLITE_VERSION=3.3.10
 SQLITE_SOURCE=sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE=http://www.sqlite.org
 SQLITE_DIR=$(BUILD_DIR)/sqlite-$(SQLITE_VERSION)
