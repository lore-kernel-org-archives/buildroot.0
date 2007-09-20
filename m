From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Sep 2007 09:47:23 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/atstk1002
Message-ID: <20070920164723.4626930068@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-20 09:47:22 -0700 (Thu, 20 Sep 2007)
New Revision: 19914

Log:
Add CONFIG_SEQ for atstk1002 busybox

Modified:
   trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.6.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.6.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.6.1.config	2007-09-20 16:46:31 UTC (rev 19913)
+++ trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.6.1.config	2007-09-20 16:47:22 UTC (rev 19914)
@@ -193,7 +193,7 @@
 # CONFIG_REALPATH is not set
 CONFIG_RM=y
 CONFIG_RMDIR=y
-# CONFIG_SEQ is not set
+CONFIG_SEQ=y
 CONFIG_SHA1SUM=y
 CONFIG_SLEEP=y
 # CONFIG_FEATURE_FANCY_SLEEP is not set
