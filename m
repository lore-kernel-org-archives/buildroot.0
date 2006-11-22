From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 11:18:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/e2fsprogs
Message-ID: <20061122191847.C8283485CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 11:18:47 -0800 (Wed, 22 Nov 2006)
New Revision: 16632

Log:
- bump version


Modified:
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk


Changeset:
Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2006-11-22 19:10:59 UTC (rev 16631)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2006-11-22 19:18:47 UTC (rev 16632)
@@ -3,7 +3,7 @@
 # e2fsprogs
 #
 #############################################################
-E2FSPROGS_VER:=1.38
+E2FSPROGS_VER:=1.39
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VER).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VER)
