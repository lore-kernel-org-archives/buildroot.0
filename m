From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Sat,  8 Nov 2008 14:24:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20081108222440.040E33C911@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-11-08 14:24:39 -0800 (Sat, 08 Nov 2008)
New Revision: 23968

Log:
Fix Grub tarball version as the current version has disappeared from
Debian mirrors.

Patch provided by Roberto A. Foglietta <roberto.foglietta@gmail.com>



Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2008-11-08 21:42:14 UTC (rev 23967)
+++ trunk/buildroot/target/x86/grub/grub.mk	2008-11-08 22:24:39 UTC (rev 23968)
@@ -21,7 +21,7 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-35.diff.gz
+GRUB_PATCH:=grub_0.97-51.diff.gz
 GRUB_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
 GRUB_PATCH_SITE:=$(GRUB_SITE)
 GRUB_CAT:=$(ZCAT)
