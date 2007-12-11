From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue, 11 Dec 2007 12:11:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20071211201121.9969512802E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-11 12:11:19 -0800 (Tue, 11 Dec 2007)
New Revision: 20639

Log:
add ts_test utility

Modified:
   trunk/buildroot/package/tslib/tslib.mk


Changeset:
Modified: trunk/buildroot/package/tslib/tslib.mk
===================================================================
--- trunk/buildroot/package/tslib/tslib.mk	2007-12-11 19:53:51 UTC (rev 20638)
+++ trunk/buildroot/package/tslib/tslib.mk	2007-12-11 20:11:19 UTC (rev 20639)
@@ -79,6 +79,8 @@
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_finddev
 	cp -dpf $(STAGING_DIR)/usr/bin/inputattach $(TARGET_DIR)/usr/bin/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/inputattach
+	cp -dpf $(STAGING_DIR)/usr/bin/ts_test $(TARGET_DIR)/usr/bin/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/ts_test
 	cp -dpf package/tslib/ts.conf $(TARGET_DIR)/etc/
 
 tslib: uclibc $(TARGET_DIR)/usr/lib/libts.so
