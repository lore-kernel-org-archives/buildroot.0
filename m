From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 11:53:37 +0000 (UTC)
Subject: [Buildroot] svn commit: [25892] trunk/buildroot/package/ntfs-3g
Message-ID: <20090330115337.DA2D4775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 11:53:37 +0000 (Mon, 30 Mar 2009)
New Revision: 25892

Log:
ntfs-3g: remove extra white space

Modified:
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
===================================================================
--- trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2009-03-30 11:53:32 UTC (rev 25891)
+++ trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2009-03-30 11:53:37 UTC (rev 25892)
@@ -46,10 +46,7 @@
 $(NTFS-3G_DIR)/.compiled: $(NTFS-3G_DIR)/.configured
 	$(MAKE) prefix=$/usr CC=$(TARGET_CC)-C $(NTFS-3G_DIR)
 	touch $@
-#		CROSS_COMPILE="$(TARGET_CROSS)"
 
-
-
 $(STAGING_DIR)/usr/bin/ntfs-3g: $(NTFS-3G_DIR)/.compiled
 	$(MAKE) prefix=$/usr -C $(NTFS-3G_DIR) DESTDIR=$(STAGING_DIR)/ install
 	touch -c $@
