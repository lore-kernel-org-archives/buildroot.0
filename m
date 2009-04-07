From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 07:16:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [26008] trunk/buildroot/package/rsync
Message-ID: <20090407071637.B8BA8768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 07:16:37 +0000 (Tue, 07 Apr 2009)
New Revision: 26008

Log:
rsync: bump version

Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2009-04-07 07:01:20 UTC (rev 26007)
+++ trunk/buildroot/package/rsync/rsync.mk	2009-04-07 07:16:37 UTC (rev 26008)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RSYNC_VERSION:=3.0.3
+RSYNC_VERSION:=3.0.5
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
 RSYNC_AUTORECONF:=no
