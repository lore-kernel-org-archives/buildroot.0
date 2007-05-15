From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 04:39:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20070515113945.624DE4807E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 04:39:44 -0700 (Tue, 15 May 2007)
New Revision: 18626

Log:
- bump patch version


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2007-05-15 11:33:08 UTC (rev 18625)
+++ trunk/buildroot/target/x86/grub/grub.mk	2007-05-15 11:39:44 UTC (rev 18626)
@@ -21,7 +21,7 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-22.diff.gz
+GRUB_PATCH:=grub_0.97-28.diff.gz
 GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_PATCH_SITE:=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
