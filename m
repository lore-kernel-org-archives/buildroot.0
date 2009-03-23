From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 09:44:13 +0000 (UTC)
Subject: [Buildroot] svn commit: [25791] trunk/buildroot/target/generic
Message-ID: <20090323094413.6E9FC7656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 09:44:13 +0000 (Mon, 23 Mar 2009)
New Revision: 25791

Log:
target/generic: s/TTYSO/TTYS0/

Thanks to Hiroshi Shinji for noticing.

Modified:
   trunk/buildroot/target/generic/Config.in


Changeset:
Modified: trunk/buildroot/target/generic/Config.in
===================================================================
--- trunk/buildroot/target/generic/Config.in	2009-03-23 09:44:07 UTC (rev 25790)
+++ trunk/buildroot/target/generic/Config.in	2009-03-23 09:44:13 UTC (rev 25791)
@@ -68,13 +68,13 @@
 
 choice
 	prompt "Serial port to run a getty on"
-	default BR2_TARGET_GENERIC_GETTY_TTYSO
+	default BR2_TARGET_GENERIC_GETTY_TTYS0
 	help
 	  Select a port to run a getty (login prompt) on.
 
 config BR2_TARGET_GENERIC_GETTY_NONE
 	bool "none"
-config BR2_TARGET_GENERIC_GETTY_TTYSO
+config BR2_TARGET_GENERIC_GETTY_TTYS0
 	bool "ttyS0"
 config BR2_TARGET_GENERIC_GETTY_TTYS1
 	bool "ttyS1"
