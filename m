From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 20 Aug 2008 07:15:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rsync
Message-ID: <20080820141515.D76D73C729@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-20 07:15:15 -0700 (Wed, 20 Aug 2008)
New Revision: 23119

Log:
rsync: bump version

Modified:
   trunk/buildroot/package/rsync/rsync.mk


Changeset:
Modified: trunk/buildroot/package/rsync/rsync.mk
===================================================================
--- trunk/buildroot/package/rsync/rsync.mk	2008-08-20 14:15:10 UTC (rev 23118)
+++ trunk/buildroot/package/rsync/rsync.mk	2008-08-20 14:15:15 UTC (rev 23119)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-RSYNC_VERSION:=2.6.9
+RSYNC_VERSION:=3.0.3
 RSYNC_SOURCE:=rsync-$(RSYNC_VERSION).tar.gz
 RSYNC_SITE:=http://rsync.samba.org/ftp/rsync/src
 RSYNC_AUTORECONF:=no
