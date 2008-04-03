From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Apr 2008 02:28:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/diffutils
	package/gzip target/x8 etc...
Message-ID: <20080403092856.ACAED3C3D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-03 02:28:56 -0700 (Thu, 03 Apr 2008)
New Revision: 21623

Log:
gzip, diff, grub: bump versions

Patch by andrewma (closes #2754)


Modified:
   trunk/buildroot/package/diffutils/diffutils.mk
   trunk/buildroot/package/gzip/gzip.mk
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2008-04-03 04:10:14 UTC (rev 21622)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2008-04-03 09:28:56 UTC (rev 21623)
@@ -3,9 +3,8 @@
 # diffutils
 #
 #############################################################
-DIFFUTILS_VERSION=2.8.7
+DIFFUTILS_VERSION=2.8.1
 DIFFUTILS_SOURCE:=diffutils-$(DIFFUTILS_VERSION).tar.gz
-#DIFFUTILS_SITE:=ftp://alpha.gnu.org/gnu/diffutils/
 DIFFUTILS_SITE:=$(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_CAT:=$(ZCAT)
 DIFFUTILS_DIR:=$(BUILD_DIR)/diffutils-$(DIFFUTILS_VERSION)

Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2008-04-03 04:10:14 UTC (rev 21622)
+++ trunk/buildroot/package/gzip/gzip.mk	2008-04-03 09:28:56 UTC (rev 21623)
@@ -3,9 +3,8 @@
 # gzip
 #
 #############################################################
-GZIP_VERSION:=1.3.5
+GZIP_VERSION:=1.3.12
 GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
-#GZIP_SITE:=ftp://alpha.gnu.org/gnu/gzip
 GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
 GZIP_DIR:=$(BUILD_DIR)/gzip-$(GZIP_VERSION)
 GZIP_CAT:=$(ZCAT)

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2008-04-03 04:10:14 UTC (rev 21622)
+++ trunk/buildroot/target/x86/grub/grub.mk	2008-04-03 09:28:56 UTC (rev 21623)
@@ -21,9 +21,9 @@
 #
 #############################################################
 GRUB_SOURCE:=grub_0.97.orig.tar.gz
-GRUB_PATCH:=grub_0.97-31.diff.gz
+GRUB_PATCH:=grub_0.97-35.diff.gz
 GRUB_SITE=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
-GRUB_PATCH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/g/grub
+GRUB_PATCH_SITE:=$(GRUB_SITE)
 GRUB_CAT:=$(ZCAT)
 GRUB_DIR:=$(BUILD_DIR)/grub-0.97
 GRUB_BINARY:=grub/grub
