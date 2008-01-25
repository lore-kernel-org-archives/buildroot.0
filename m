From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Fri, 25 Jan 2008 02:02:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mrouted
Message-ID: <20080125100235.69B6312C63C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-01-25 02:02:32 -0800 (Fri, 25 Jan 2008)
New Revision: 20899

Log:
Changed site since it is nto a part of Debian any more. Closing bug 
#1974


Modified:
   trunk/buildroot/package/mrouted/mrouted.mk


Changeset:
Modified: trunk/buildroot/package/mrouted/mrouted.mk
===================================================================
--- trunk/buildroot/package/mrouted/mrouted.mk	2008-01-25 09:46:21 UTC (rev 20898)
+++ trunk/buildroot/package/mrouted/mrouted.mk	2008-01-25 10:02:32 UTC (rev 20899)
@@ -6,7 +6,7 @@
 #############################################################
 MROUTED_VERSION:=3.9-beta3.orig
 MROUTED_SOURCE:=mrouted_$(MROUTED_VERSION).tar.gz
-MROUTED_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/non-free/m/mrouted
+MROUTED_SITE:=http://archive.debian.org/debian-archive/pool/non-free/m/mrouted/
 MROUTED_DIR:=$(BUILD_DIR)/mrouted-$(MROUTED_VERSION)
 MROUTED_CAT:=$(ZCAT)
 MROUTED_PATCH:=mrouted_3.9-beta3-1.1.diff.gz
