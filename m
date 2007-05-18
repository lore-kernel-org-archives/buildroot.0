From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 18 May 2007 02:59:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20070518095937.81AE848560@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-18 02:59:36 -0700 (Fri, 18 May 2007)
New Revision: 18651

Log:
- fix path to staging binary. Closes #1353


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2007-05-18 09:55:09 UTC (rev 18650)
+++ trunk/buildroot/package/dm/dm.mk	2007-05-18 09:59:36 UTC (rev 18651)
@@ -31,7 +31,7 @@
 DM_SITE_OLD:=ftp://sources.redhat.com/pub/dm/old
 DM_CAT:=$(ZCAT)
 DM_DIR:=$(BUILD_DIR)/device-mapper.$(DM_VERSION)
-DM_STAGING_BINARY:=$(STAGING_DIR)/sbin/dmsetup
+DM_STAGING_BINARY:=$(STAGING_DIR)/usr/sbin/dmsetup
 DM_TARGET_BINARY:=$(TARGET_DIR)/usr/sbin/dmsetup
 DM_STAGING_LIBRARY:=$(STAGING_DIR)/lib/libdevmapper.so
 DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
