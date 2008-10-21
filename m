From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Oct 2008 11:50:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/xapp_xfs
Message-ID: <20081021185049.898EA3C6F3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-21 11:50:49 -0700 (Tue, 21 Oct 2008)
New Revision: 23759

Log:
x11r7/xfs: bump version - fixes CVE-2007-4568

For details, see:
http://lists.freedesktop.org/archives/xorg-announce/2007-October/000416.html

Modified:
   trunk/buildroot/package/x11r7/xapp_xfs/xapp_xfs.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xapp_xfs/xapp_xfs.mk
===================================================================
--- trunk/buildroot/package/x11r7/xapp_xfs/xapp_xfs.mk	2008-10-21 17:26:10 UTC (rev 23758)
+++ trunk/buildroot/package/x11r7/xapp_xfs/xapp_xfs.mk	2008-10-21 18:50:49 UTC (rev 23759)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.0.4
+XAPP_XFS_VERSION = 1.0.5
 XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.bz2
 XAPP_XFS_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XFS_AUTORECONF = NO
