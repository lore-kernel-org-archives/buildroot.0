From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:06:06 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/DataFlashBoot
Message-ID: <20070729070606.29EB4A4674@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:06:05 -0700 (Sun, 29 Jul 2007)
New Revision: 19313

Log:
Reintroduce ATMEL_MIRROR in dataflashboot

Modified:
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-07-29 07:05:13 UTC (rev 19312)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-07-29 07:06:05 UTC (rev 19313)
@@ -5,6 +5,7 @@
 #############################################################
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)/Source
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
