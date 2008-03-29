From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 13:38:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20080329203822.859463C4F0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 13:38:22 -0700 (Sat, 29 Mar 2008)
New Revision: 21565

Log:
Remove duplication of default kernel patch dir setting

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2008-03-29 20:36:54 UTC (rev 21564)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2008-03-29 20:38:22 UTC (rev 21565)
@@ -47,7 +47,7 @@
 
 LINUX26_COPYTO:=/tftpboot
 
-LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches
+#LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches
 
 # The board specific Makefile.in can redefine BOARD_NAME's
 LINUX_BOARD_NAME:=$(BOARD_NAME)
