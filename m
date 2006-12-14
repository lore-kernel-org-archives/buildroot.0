From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 07:25:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/asterisk
Message-ID: <20061214152547.06C57485E2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 07:25:47 -0800 (Thu, 14 Dec 2006)
New Revision: 16924

Log:
- update path. Closes #896.


Modified:
   trunk/buildroot/package/asterisk/asterisk.mk


Changeset:
Modified: trunk/buildroot/package/asterisk/asterisk.mk
===================================================================
--- trunk/buildroot/package/asterisk/asterisk.mk	2006-12-14 15:17:39 UTC (rev 16923)
+++ trunk/buildroot/package/asterisk/asterisk.mk	2006-12-14 15:25:47 UTC (rev 16924)
@@ -5,7 +5,7 @@
 ##############################################################
 ASTERISK_VERSION := 1.2.0-beta1
 ASTERISK_SOURCE := asterisk-$(ASTERISK_VERSION).tar.gz
-ASTERISK_SITE := ftp://ftp.digium.com/pub/asterisk
+ASTERISK_SITE := ftp://ftp.digium.com/pub/asterisk/old-releases
 ASTERISK_DIR := $(BUILD_DIR)/asterisk-$(ASTERISK_VERSION)
 ASTERISK_BINARY := asterisk
 ASTERISK_TARGET_BINARY := usr/sbin/asterisk
