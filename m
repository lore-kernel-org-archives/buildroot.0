From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:12:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse
Message-ID: <20080710101202.707DB3C2E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:12:00 -0700 (Thu, 10 Jul 2008)
New Revision: 22748

Log:
fuse: remove stray $

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:11:51 UTC (rev 22747)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:00 UTC (rev 22748)
@@ -49,7 +49,7 @@
 
 
 $(STAGING_DIR)/usr/lib/libfuse.so: $(LIBFUSE_DIR)/.compiled
-	$(MAKE) prefix=$/usr -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
+	$(MAKE) prefix=/usr -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libfuse.so: $(STAGING_DIR)/usr/lib/libfuse.so
