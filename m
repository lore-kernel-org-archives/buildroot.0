From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Aug 2008 02:40:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ifplugd
Message-ID: <20080819094018.9D5AE3C838@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-19 02:40:18 -0700 (Tue, 19 Aug 2008)
New Revision: 23103

Log:
ifplugd: add missing newline

Modified:
   trunk/buildroot/package/ifplugd/ifplugd.mk


Changeset:
Modified: trunk/buildroot/package/ifplugd/ifplugd.mk
===================================================================
--- trunk/buildroot/package/ifplugd/ifplugd.mk	2008-08-17 14:17:48 UTC (rev 23102)
+++ trunk/buildroot/package/ifplugd/ifplugd.mk	2008-08-19 09:40:18 UTC (rev 23103)
@@ -28,4 +28,4 @@
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
-	touch $@
\ No newline at end of file
+	touch $@
