From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Oct 2006 01:10:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061025081026.EB5B7485F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-10-25 01:10:26 -0700 (Wed, 25 Oct 2006)
New Revision: 16434

Log:
Bump to upstream v1.2.2

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-10-25 00:33:44 UTC (rev 16433)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-10-25 08:10:26 UTC (rev 16434)
@@ -10,7 +10,7 @@
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
-BUSYBOX_VER:=1.2.1
+BUSYBOX_VER:=1.2.2
 BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VER)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VER).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
