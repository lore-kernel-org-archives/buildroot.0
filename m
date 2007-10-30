From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 14:58:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lvm2
Message-ID: <20071030215816.A8693A658A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 14:58:15 -0700 (Tue, 30 Oct 2007)
New Revision: 20341

Log:
Bump lvm2 patch version

Modified:
   trunk/buildroot/package/lvm2/lvm2.mk


Changeset:
Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2007-10-30 21:57:43 UTC (rev 20340)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2007-10-30 21:58:15 UTC (rev 20341)
@@ -24,7 +24,7 @@
 # USA
 
 LVM2_BASEVER=2.02
-LVM2_PATCH=26
+LVM2_PATCH=28
 LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
