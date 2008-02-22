From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri, 22 Feb 2008 11:37:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20080222193740.42EF412C75F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-02-22 11:37:39 -0800 (Fri, 22 Feb 2008)
New Revision: 21086

Log:
Update diff version.


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2008-02-21 04:35:14 UTC (rev 21085)
+++ trunk/buildroot/target/x86/grub/grub.mk	2008-02-22 19:37:39 UTC (rev 21086)
@@ -21,7 +21,7 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-28.diff.gz
+GRUB_PATCH:=grub_0.97-31.diff.gz
 GRUB_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
 GRUB_PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
