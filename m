From: jacmet@uclibc.org <jacmet@uclibc.org>
Date: Mon Jul 31 09:01:17 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20060731160116.40284486FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-07-31 09:01:15 -0700 (Mon, 31 Jul 2006)
New Revision: 15757

Log:
Bump to upstream v1.2.1

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-07-30 18:56:29 UTC (rev 15756)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-07-31 16:01:15 UTC (rev 15757)
@@ -10,7 +10,7 @@
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
-BUSYBOX_VER:=1.1.3
+BUSYBOX_VER:=1.2.1
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
