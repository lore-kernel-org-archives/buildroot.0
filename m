From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 05:17:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/memtester
Message-ID: <20061213131719.761B548573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 05:17:18 -0800 (Wed, 13 Dec 2006)
New Revision: 16897

Log:
bump version as old version has gone missing


Modified:
   trunk/buildroot/package/memtester/memtester.mk


Changeset:
Modified: trunk/buildroot/package/memtester/memtester.mk
===================================================================
--- trunk/buildroot/package/memtester/memtester.mk	2006-12-13 13:13:02 UTC (rev 16896)
+++ trunk/buildroot/package/memtester/memtester.mk	2006-12-13 13:17:18 UTC (rev 16897)
@@ -3,9 +3,9 @@
 # memtester
 #
 #############################################################
-MEMTESTER_VER:=4.0.5
+MEMTESTER_VER:=4.0.6
 MEMTESTER_SOURCE:=memtester-$(MEMTESTER_VER).tar.gz
-MEMTESTER_SITE:=http://pyropus.ca/software/memtester
+MEMTESTER_SITE:=http://pyropus.ca/software/memtester/old-versions/
 MEMTESTER_DIR:=$(BUILD_DIR)/memtester-$(MEMTESTER_VER)
 MEMTESTER_BINARY:=memtester
 MEMTESTER_TARGET_BINARY:=usr/bin/memtester
