From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Sun,  2 Mar 2008 02:25:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20080302102506.0A2D3120194@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-03-02 02:25:05 -0800 (Sun, 02 Mar 2008)
New Revision: 21146

Log:
Closing #2374


Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-03-01 19:29:56 UTC (rev 21145)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-03-02 10:25:05 UTC (rev 21146)
@@ -15,7 +15,7 @@
 UBOOT_SOURCE:=u-boot-$(UBOOT_VERSION).tar.bz2
 #UBOOT_SOURCE:=u-boot-1.1.5-atmel.tar.bz2
 #UBOOT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/u-boot
-UBOOT_SITE:=$(ATMEL_MIRROR)/Source
+UBOOT_SITE:=$(ATMEL_MIRROR)
 UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)
 UBOOT_CAT:=$(BZCAT)
 UBOOT_PATCH_SOURCE:=u-boot-1.2.0-atmel-patch.tar.bz2
