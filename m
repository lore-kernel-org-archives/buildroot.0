From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Sep 2007 09:44:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20070920164416.41018A658C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-20 09:44:15 -0700 (Thu, 20 Sep 2007)
New Revision: 19912

Log:
Enable CONFIG_SEQ in busybox for ngw100

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config	2007-09-20 16:43:16 UTC (rev 19911)
+++ trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config	2007-09-20 16:44:15 UTC (rev 19912)
@@ -193,7 +193,7 @@
 # CONFIG_REALPATH is not set
 CONFIG_RM=y
 CONFIG_RMDIR=y
-# CONFIG_SEQ is not set
+CONFIG_SEQ=y
 CONFIG_SHA1SUM=y
 CONFIG_SLEEP=y
 # CONFIG_FEATURE_FANCY_SLEEP is not set
