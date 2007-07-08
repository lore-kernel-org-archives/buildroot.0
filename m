From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 05:04:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070708120435.94C9AA65C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 05:04:34 -0700 (Sun, 08 Jul 2007)
New Revision: 19030

Log:
- fdisk was broken in r18727, disable for now.


Modified:
   trunk/buildroot/package/busybox/busybox-1.6.0.config


Changeset:
Modified: trunk/buildroot/package/busybox/busybox-1.6.0.config
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.6.0.config	2007-07-08 11:56:38 UTC (rev 19029)
+++ trunk/buildroot/package/busybox/busybox-1.6.0.config	2007-07-08 12:04:34 UTC (rev 19030)
@@ -404,7 +404,7 @@
 # CONFIG_FEATURE_FBSET_READMODE is not set
 CONFIG_FDFLUSH=y
 CONFIG_FDFORMAT=y
-CONFIG_FDISK=y
+# CONFIG_FDISK is not set
 CONFIG_FDISK_SUPPORT_LARGE_DISKS=y
 CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_AIX_LABEL is not set
