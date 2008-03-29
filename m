From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 13:39:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/valka
Message-ID: <20080329203936.7D6633C4FC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 13:39:36 -0700 (Sat, 29 Mar 2008)
New Revision: 21566

Log:
Remove duplication of default kernel patch dir setting

Modified:
   trunk/buildroot/target/device/valka/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/valka/Makefile.in
===================================================================
--- trunk/buildroot/target/device/valka/Makefile.in	2008-03-29 20:38:22 UTC (rev 21565)
+++ trunk/buildroot/target/device/valka/Makefile.in	2008-03-29 20:39:36 UTC (rev 21566)
@@ -6,7 +6,7 @@
 
 TARGET_SKELETON=$(VALKA_PATH)/target_skeleton
 TARGET_DEVICE_TABLE=$(VALKA_PATH)/device_table.txt
-LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches
+#LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches
 
 valka_status:
 	@echo "***************************************************************"
