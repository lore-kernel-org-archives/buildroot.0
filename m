From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  9 Apr 2009 09:46:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [26040]
	trunk/buildroot/package/database/sqlite
Message-ID: <20090409094648.89F3F769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-09 09:46:48 +0000 (Thu, 09 Apr 2009)
New Revision: 26040

Log:
sqlite: bump version

Fixes database corruption with rollback
http://www.sqlite.org/releaselog/3_6_12.html

Modified:
   trunk/buildroot/package/database/sqlite/sqlite.mk


Changeset:
Modified: trunk/buildroot/package/database/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/database/sqlite/sqlite.mk	2009-04-09 08:51:43 UTC (rev 26039)
+++ trunk/buildroot/package/database/sqlite/sqlite.mk	2009-04-09 09:46:48 UTC (rev 26040)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3.6.11
+SQLITE_VERSION = 3.6.12
 SQLITE_SOURCE = sqlite-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
