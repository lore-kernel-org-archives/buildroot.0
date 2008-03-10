From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Mon, 10 Mar 2008 09:17:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rsync
Message-ID: <20080310161728.1D00F12011A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-10 09:17:26 -0700 (Mon, 10 Mar 2008)
New Revision: 21283

Log:
cheanged rsync download url

Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2008-03-10 15:22:43 UTC (rev 21282)
+++ trunk/buildroot/package/rsync/rsync.mk	2008-03-10 16:17:26 UTC (rev 21283)
@@ -5,7 +5,7 @@
 #############################################################
 RSYNC_VERSION:=2.6.9
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
-RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/
+RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
 RSYNC_DIR:=$(BUILD_DIR)/rsync-$(RSYNC_VERSION)
 RSYNC_CAT:=$(ZCAT)
 RSYNC_BINARY:=rsync
