From: correa at uclibc.org <correa@uclibc.org>
Date: Tue,  1 Jul 2008 17:17:21 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-avr32
Message-ID: <20080702001721.665AE3C6A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-01 17:17:21 -0700 (Tue, 01 Jul 2008)
New Revision: 22605

Log:
Remove trailing quote from help lines

Modified:
   trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches	2008-07-02 00:12:06 UTC (rev 22604)
+++ trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches	2008-07-02 00:17:21 UTC (rev 22605)
@@ -15,32 +15,32 @@
 config	BR2_ARCH_AVR32_2_6_24
 	bool "2.6.24"
 	help
-	  Apply the avr32 linux-2.6.24 patches"
+	  Apply the avr32 linux-2.6.24 patches
 
 config	BR2_ARCH_AVR32_2_6_23
 	bool "2.6.23"
 	help
-	  Apply the avr32 linux-2.6.23 patches"
+	  Apply the avr32 linux-2.6.23 patches
 
 config	BR2_ARCH_AVR32_2_6_22_10
 	bool "2.6.22.10"
 	help
-	  Apply the avr32 linux-2.6.22.10 patches"
+	  Apply the avr32 linux-2.6.22.10 patches
 
 config	BR2_ARCH_AVR32_2_6_22_1
 	bool "2.6.22.1"
 	help
-	  Apply the avr32 linux-2.6.22.1 patches"
+	  Apply the avr32 linux-2.6.22.1 patches
 
 config	BR2_ARCH_AVR32_2_6_21_5
 	bool "2.6.21.5"
 	help
-	  Apply the avr32 linux-2.6.21.5 patches"
+	  Apply the avr32 linux-2.6.21.5 patches
 
 config	BR2_ARCH_AVR32_2_6_20_4
 	bool "2.6.20.4"
 	help
-	  Apply the avr32 linux-2.6.20.4 patches"
+	  Apply the avr32 linux-2.6.20.4 patches
 
 endchoice
 
