From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 20 Nov 2006 08:40:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rsync
Message-ID: <20061120164020.44189485D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-20 08:40:19 -0800 (Mon, 20 Nov 2006)
New Revision: 16591

Log:
- bump version


Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2006-11-20 16:33:05 UTC (rev 16590)
+++ trunk/buildroot/package/rsync/rsync.mk	2006-11-20 16:40:19 UTC (rev 16591)
@@ -3,7 +3,7 @@
 # rsync
 #
 #############################################################
-RSYNC_VER:=2.6.8
+RSYNC_VER:=2.6.9
 RSYNC_SOURCE:=rsync-$(RSYNC_VER).tar.gz
 RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/
 RSYNC_DIR:=$(BUILD_DIR)/rsync-$(RSYNC_VER)
