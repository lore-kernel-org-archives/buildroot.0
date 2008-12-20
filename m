From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:26:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20081220222624.AD44976CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:26:24 +0000 (Sat, 20 Dec 2008)
New Revision: 24472

Log:
Add AP7200 eval kit configuration

Modified:
   trunk/buildroot/target/device/Atmel/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2008-12-20 22:24:11 UTC (rev 24471)
+++ trunk/buildroot/target/device/Atmel/Config.in	2008-12-20 22:26:24 UTC (rev 24472)
@@ -24,9 +24,10 @@
 	default	"at91sam9m10ek"		if	BR2_TARGET_AT91SAM9M10EK
 	default	"at91sam9m10dfc"	if	BR2_TARGET_AT91SAM9M10DFC
 	default	"atstk100x"		if	BR2_TARGET_AVR32_ATSTK1002
+	default	"atstk1005"		if	BR2_TARGET_AVR32_ATSTK1005
 	default	"atngw100"		if	BR2_TARGET_AVR32_ATNGW100
 	default "atngw100-base"		if	BR2_TARGET_AVR32_ATNGW100_BASE
-	default "atngw100-expanded"	if  BR2_TARGET_AVR32_ATNGW100_EXPANDED
+	default "atngw100-expanded"	if	BR2_TARGET_AVR32_ATNGW100_EXPANDED
 
 config BR2_TARGET_AT91_ADVANCED_INFO
 	bool "Remove work in progress"
