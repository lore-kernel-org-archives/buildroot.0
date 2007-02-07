From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  7 Feb 2007 02:43:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20070207104305.E7A43485B7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-07 02:43:04 -0800 (Wed, 07 Feb 2007)
New Revision: 17805

Log:
- bump patch version. Thanks to Alexander Rigbo for pointing this out.


Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2007-02-07 02:51:45 UTC (rev 17804)
+++ trunk/buildroot/target/x86/grub/grub.mk	2007-02-07 10:43:04 UTC (rev 17805)
@@ -21,7 +21,7 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-20.diff.gz
+GRUB_PATCH:=grub_0.97-22.diff.gz
 GRUB_SITE=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_PATCH_SITE:=http://ftp.debian.org/debian/pool/main/g/grub
 GRUB_CAT:=$(ZCAT)
