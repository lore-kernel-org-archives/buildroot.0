From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:11:21 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/DataFlashBoot
Message-ID: <20070729071121.366D0A4682@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:11:20 -0700 (Sun, 29 Jul 2007)
New Revision: 19315

Log:
Fix vi syntax  highlighting in dataflashboot

Modified:
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-07-29 07:09:57 UTC (rev 19314)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2007-07-29 07:11:20 UTC (rev 19315)
@@ -6,6 +6,7 @@
 DATAFLASHBOOT_VERSION:=1.05
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
 ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+#"))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)/Source
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
