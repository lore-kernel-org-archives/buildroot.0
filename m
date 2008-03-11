From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Tue, 11 Mar 2008 09:19:34 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20080311161934.17BE312013C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-11 09:19:33 -0700 (Tue, 11 Mar 2008)
New Revision: 21295

Log:
download url was invalid

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-03-11 15:58:05 UTC (rev 21294)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-03-11 16:19:33 UTC (rev 21295)
@@ -6,7 +6,7 @@
 AT91BOOTSTRAP_VERSION:=2.3
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
-AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)/Source
+AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
 AT91BOOTSTRAP:=$(strip  $(subst ",, $(BR2_AT91BOOTSTRAP)))
