From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 17 Dec 2008 01:28:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20081217092834.1782A3C6C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-17 01:28:33 -0800 (Wed, 17 Dec 2008)
New Revision: 24437

Log:
Remove AVR32 target variants, the current entries refers to CHIPS which have the same CPU core, CHIP variant is defined elsewhere

Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2008-12-17 06:32:19 UTC (rev 24436)
+++ trunk/buildroot/target/Config.in.arch	2008-12-17 09:28:33 UTC (rev 24437)
@@ -186,18 +186,6 @@
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_avr32
-config BR2_at32ap7000
-	bool "AT32AP7000"
-config BR2_at32ap7001
-	bool "AT32AP7001"
-config BR2_at32ap7002
-	bool "AT32AP7002"
-endchoice
-
-
-choice
-	prompt "Target Architecture Variant"
 	depends on BR2_sh
 	default BR2_sh4
 	help
