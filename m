From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 18 Oct 2007 05:37:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20071018123736.7990EA683E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-18 05:37:36 -0700 (Thu, 18 Oct 2007)
New Revision: 20286

Log:
Use default linux kernel name

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-10-18 12:37:09 UTC (rev 20285)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-10-18 12:37:36 UTC (rev 20286)
@@ -72,7 +72,7 @@
 
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config
 
-LINUX26_KERNEL=$(BINARIES_DIR)/$(PROJECT)-linux-$(LINUX26_VERSION)-$(DATE)
+#LINUX26_KERNEL=$(BINARIES_DIR)/$(PROJECT)-linux-$(LINUX26_VERSION)-$(DATE)
 
 # Update things in board specific makefiles
 include target/device/Atmel/*/Makefile.in
