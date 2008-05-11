From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 May 2008 23:46:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntfs-3g
Message-ID: <20080511064621.694D13C866@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-10 23:46:20 -0700 (Sat, 10 May 2008)
New Revision: 21969

Log:
Bump ntfs-3g version

Modified:
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
===================================================================
--- trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2008-05-11 06:45:47 UTC (rev 21968)
+++ trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2008-05-11 06:46:20 UTC (rev 21969)
@@ -3,7 +3,7 @@
 # ntfs-3g
 #
 #############################################################
-NTFS-3G_VERSION:=1.810
+NTFS-3G_VERSION:=1.2506
 NTFS-3G_SOURCE:=ntfs-3g-$(NTFS-3G_VERSION).tgz
 NTFS-3G_SITE:=www.ntfs-3g.org
 NTFS-3G_DIR:=$(BUILD_DIR)/ntfs-3g-$(NTFS-3G_VERSION)
