From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Dec 2006 09:08:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20061220170838.BD57B485C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-20 09:08:38 -0800 (Wed, 20 Dec 2006)
New Revision: 17019

Log:
- bump patch version


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2006-12-20 16:50:04 UTC (rev 17018)
+++ trunk/buildroot/target/x86/grub/grub.mk	2006-12-20 17:08:38 UTC (rev 17019)
@@ -21,7 +21,7 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH=grub_0.97-19.diff.gz
+GRUB_PATCH=grub_0.97-20.diff.gz
 GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
