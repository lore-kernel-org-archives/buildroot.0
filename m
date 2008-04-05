From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  5 Apr 2008 09:11:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/ARM
Message-ID: <20080405161104.2E3F23C30B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-05 09:11:03 -0700 (Sat, 05 Apr 2008)
New Revision: 21644

Log:
target/device/ARM: don't override busybox config


Modified:
   trunk/buildroot/target/device/ARM/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/ARM/Makefile.in
===================================================================
--- trunk/buildroot/target/device/ARM/Makefile.in	2008-04-05 04:24:23 UTC (rev 21643)
+++ trunk/buildroot/target/device/ARM/Makefile.in	2008-04-05 16:11:03 UTC (rev 21644)
@@ -34,9 +34,6 @@
 # The board specific Makefile.in can redefine BOARD_NAME's
 LINUX_BOARD_NAME:=$(BOARD_NAME)
 
-BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox.config
-
-
 # Needs to be AFTER board specific Makefiles
 
 arm_status:
