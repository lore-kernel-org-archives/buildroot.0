From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 00:59:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070723075957.0E774A4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 00:59:56 -0700 (Mon, 23 Jul 2007)
New Revision: 19199

Log:
Use correct AVR32 chip id's

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-23 07:57:31 UTC (rev 19198)
+++ trunk/buildroot/Config.in	2007-07-23 07:59:56 UTC (rev 19199)
@@ -128,10 +128,10 @@
 	depends BR2_avr32
 config BR2_ap7000
 	bool "AP7000"
-config BR2_ap7010
-	bool "AP7010"
-config BR2_ap7020
-	bool "AP7020"
+config BR2_ap7001
+	bool "AP7001"
+config BR2_ap7002
+	bool "AP7002"
 endchoice
 
 
