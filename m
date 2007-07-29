From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:09:57 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20070729070957.3FFD0A4674@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:09:57 -0700 (Sun, 29 Jul 2007)
New Revision: 19314

Log:
Reintroduce ATMEL_MIRROR in at91bootstrap

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-07-29 07:06:05 UTC (rev 19313)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2007-07-29 07:09:57 UTC (rev 19314)
@@ -5,6 +5,8 @@
 #############################################################
 AT91BOOTSTRAP_VERSION:=2.3
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+#"))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)/Source
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
