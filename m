From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  4 Apr 2008 00:17:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080404071735.E45763C387@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-04 00:17:34 -0700 (Fri, 04 Apr 2008)
New Revision: 21632

Log:
busybox-1.6.0.config: disable TASKSET.

Disable CONFIG_TASKSET as it only compiles if
sched_{g,s}etaffinity support is available.


Modified:
   trunk/buildroot/package/busybox/busybox-1.6.0.config


Changeset:
Modified: trunk/buildroot/package/busybox/busybox-1.6.0.config
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.6.0.config	2008-04-04 07:12:42 UTC (rev 21631)
+++ trunk/buildroot/package/busybox/busybox-1.6.0.config	2008-04-04 07:17:34 UTC (rev 21632)
@@ -495,7 +495,7 @@
 # CONFIG_RX is not set
 CONFIG_STRINGS=y
 CONFIG_SETSID=y
-CONFIG_TASKSET=y
+# CONFIG_TASKSET is not set
 CONFIG_FEATURE_TASKSET_FANCY=y
 CONFIG_TIME=y
 CONFIG_WATCHDOG=y
