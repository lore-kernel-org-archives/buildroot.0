From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 07:22:32 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20061122152232.3C18C48586@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 07:22:31 -0800 (Wed, 22 Nov 2006)
New Revision: 16619

Log:
- bump version


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2006-11-22 09:39:48 UTC (rev 16618)
+++ trunk/buildroot/target/x86/grub/grub.mk	2006-11-22 15:22:31 UTC (rev 16619)
@@ -21,7 +21,7 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH=grub_0.97-18.diff.gz
+GRUB_PATCH=grub_0.97-19.diff.gz
 GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
