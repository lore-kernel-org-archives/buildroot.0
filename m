From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 23:51:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070729065136.03E16A456C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 23:51:35 -0700 (Sat, 28 Jul 2007)
New Revision: 19311

Log:
Use full AVR32 partname

Modified:
   trunk/buildroot/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-07-28 23:17:27 UTC (rev 19310)
+++ trunk/buildroot/Config.in	2007-07-29 06:51:35 UTC (rev 19311)
@@ -126,12 +126,12 @@
 choice
 	prompt "Target Architecture Variant"
 	depends BR2_avr32
-config BR2_ap7000
-	bool "AP7000"
-config BR2_ap7001
-	bool "AP7001"
-config BR2_ap7002
-	bool "AP7002"
+config BR2_at32ap7000
+	bool "AT32AP7000"
+config BR2_at32ap7001
+	bool "AT32AP7001"
+config BR2_at32ap7002
+	bool "AT32AP7002"
 endchoice
 
 
