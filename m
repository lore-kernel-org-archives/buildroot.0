From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 05:09:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20061213130941.C564D4856D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 05:09:41 -0800 (Wed, 13 Dec 2006)
New Revision: 16895

Log:
stupid typo


Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2006-12-13 13:07:47 UTC (rev 16894)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2006-12-13 13:09:41 UTC (rev 16895)
@@ -28,7 +28,7 @@
 	touch $(LIBDAEMON_DIR)/.unpacked
 
 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
-	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
+	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoconf)
 	( \
 		cd $(LIBDAEMON_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
