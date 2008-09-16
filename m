From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 16 Sep 2008 11:44:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/generic:
	target_busybox_skeleton/etc target_skele etc...
Message-ID: <20080916184454.787513C851@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-16 11:44:54 -0700 (Tue, 16 Sep 2008)
New Revision: 23409

Log:
target/generic: add uartlite ttyULx devices to securetty

Modified:
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty
   trunk/buildroot/target/generic/target_skeleton/etc/securetty


Changeset:
Modified: trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty	2008-09-16 16:07:35 UTC (rev 23408)
+++ trunk/buildroot/target/generic/target_busybox_skeleton/etc/securetty	2008-09-16 18:44:54 UTC (rev 23409)
@@ -10,3 +10,7 @@
 ttyS1
 ttyS2
 ttyS3
+ttyUL0
+ttyUL1
+ttyUL2
+ttyUL3

Modified: trunk/buildroot/target/generic/target_skeleton/etc/securetty
===================================================================
--- trunk/buildroot/target/generic/target_skeleton/etc/securetty	2008-09-16 16:07:35 UTC (rev 23408)
+++ trunk/buildroot/target/generic/target_skeleton/etc/securetty	2008-09-16 18:44:54 UTC (rev 23409)
@@ -10,3 +10,7 @@
 ttyS1
 ttyS2
 ttyS3
+ttyUL0
+ttyUL1
+ttyUL2
+ttyUL3
