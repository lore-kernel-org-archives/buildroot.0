From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Mar 2009 12:32:12 +0000 (UTC)
Subject: [Buildroot] svn commit: [25627] trunk/buildroot/package/libgtk2
Message-ID: <20090312123212.7A95B76268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-12 12:32:11 +0000 (Thu, 12 Mar 2009)
New Revision: 25627

Log:
libgtk2: also get rid of gtk-demo executable

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-12 10:21:21 UTC (rev 25626)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2009-03-12 12:32:11 UTC (rev 25627)
@@ -135,5 +135,5 @@
 
 $(LIBGTK2_HOOK_POST_INSTALL):
 	$(INSTALL) -m 755 package/libgtk2/S26libgtk2 $(TARGET_DIR)/etc/init.d/
-	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo
+	rm -rf $(TARGET_DIR)/usr/share/gtk-2.0/demo $(TARGET_DIR)/usr/bin/gtk-demo
 	touch $@
