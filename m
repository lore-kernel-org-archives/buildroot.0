From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 11:53:33 +0000 (UTC)
Subject: [Buildroot] svn commit: [25891] trunk/buildroot/package/ntfs-3g
Message-ID: <20090330115333.5B2AE775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 11:53:32 +0000 (Mon, 30 Mar 2009)
New Revision: 25891

Log:
ntfs-3g: remove stray line added in r24738 (Bump version of ntfs-3g to 1-5130)

Modified:
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
===================================================================
--- trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2009-03-30 10:00:48 UTC (rev 25890)
+++ trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2009-03-30 11:53:32 UTC (rev 25891)
@@ -10,7 +10,6 @@
 NTFS-3G_DIR:=$(BUILD_DIR)/ntfs-3g-$(NTFS-3G_VERSION)
 NTFS-3G_BINARY:=ntfs-3g
 
-http://www.ntfs-3g.org/ntfs-3g-1.5130.tgz
 $(DL_DIR)/$(NTFS-3G_SOURCE):
 	$(call DOWNLOAD,$(NTFS-3G_SITE),$(NTFS-3G_SOURCE))
 
