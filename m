From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 14:57:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
Message-ID: <20071030215744.2067EA6079@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 14:57:43 -0700 (Tue, 30 Oct 2007)
New Revision: 20340

Log:
Fix kismet makefile fragment syntax error

Modified:
   trunk/buildroot/package/kismet/kismet.mk


Changeset:
Modified: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	2007-10-30 21:37:39 UTC (rev 20339)
+++ trunk/buildroot/package/kismet/kismet.mk	2007-10-30 21:57:43 UTC (rev 20340)
@@ -62,8 +62,6 @@
 	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_drone
 	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
 	rm -f $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
-
-
 	-$(MAKE) -C $(KISMET_DIR) clean
 
 kismet-dirclean:
