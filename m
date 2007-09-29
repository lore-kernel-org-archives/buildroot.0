From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 12:52:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: AMD Arm
	Atmel Soekris Via jp
Message-ID: <20070929195203.C7C8C300DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 12:52:03 -0700 (Sat, 29 Sep 2007)
New Revision: 20123

Log:
- remove some duplicate entries


Modified:
   trunk/buildroot/target/device/AMD/Config.in
   trunk/buildroot/target/device/Arm/Config.in
   trunk/buildroot/target/device/Atmel/Config.in
   trunk/buildroot/target/device/Soekris/Config.in
   trunk/buildroot/target/device/Via/Config.in
   trunk/buildroot/target/device/jp/Config.in


Changeset:
Modified: trunk/buildroot/target/device/AMD/Config.in
===================================================================
--- trunk/buildroot/target/device/AMD/Config.in	2007-09-29 19:47:04 UTC (rev 20122)
+++ trunk/buildroot/target/device/AMD/Config.in	2007-09-29 19:52:03 UTC (rev 20123)
@@ -19,10 +19,3 @@
 comment "Package support"
 	depends BR2_TARGET_AMD_ALCHEMY
 
-config BR2_PACKAGE_LINUX
-	bool "linux"
-	default n
-	depends BR2_TARGET_AMD_ALCHEMY
-	help
-	    The Linux kernel.
-	    http://www.kernel.org/

Modified: trunk/buildroot/target/device/Arm/Config.in
===================================================================
--- trunk/buildroot/target/device/Arm/Config.in	2007-09-29 19:47:04 UTC (rev 20122)
+++ trunk/buildroot/target/device/Arm/Config.in	2007-09-29 19:52:03 UTC (rev 20123)
@@ -1,4 +1,4 @@
-menuconfig	BR2_TARGET_ARM
+menuconfig BR2_TARGET_ARM
 	bool "ARM Ltd. Device Support"
 	depends BR2_arm
 	default n

Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2007-09-29 19:47:04 UTC (rev 20122)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-09-29 19:52:03 UTC (rev 20123)
@@ -42,7 +42,7 @@
 	depends on BR2_TARGET_AT91
 	default "http://maxim.org.za/AT91RM9200/2.6"
 	help
-	    Main download location for AT91 Linux stuff
+	  Main download location for AT91 Linux stuff
 
 config BR2_TARGET_ATMEL_COPYTO
 	string "also copy the image to..."

Modified: trunk/buildroot/target/device/Soekris/Config.in
===================================================================
--- trunk/buildroot/target/device/Soekris/Config.in	2007-09-29 19:47:04 UTC (rev 20122)
+++ trunk/buildroot/target/device/Soekris/Config.in	2007-09-29 19:52:03 UTC (rev 20123)
@@ -17,11 +17,3 @@
 comment "Package support"
 	depends on BR2_TARGET_SOEKRIS_NET4521 || BR2_TARGET_SOEKRIS_NET4801
 
-config BR2_PACKAGE_LINUX
-	bool "linux"
-	depends on BR2_TARGET_SOEKRIS_NET4521 || BR2_TARGET_SOEKRIS_NET4801
-	default n
-	help
-	    The Linux kernel.
-
-	    http://www.kernel.org/

Modified: trunk/buildroot/target/device/Via/Config.in
===================================================================
--- trunk/buildroot/target/device/Via/Config.in	2007-09-29 19:47:04 UTC (rev 20122)
+++ trunk/buildroot/target/device/Via/Config.in	2007-09-29 19:52:03 UTC (rev 20123)
@@ -6,11 +6,3 @@
 	help
 	  The Via EPIA MII board
 
-config BR2_PACKAGE_LINUX
-	bool "linux"
-	default n
-	depends BR2_TARGET_VIA_EPIA_MII
-	help
-	    The Linux kernel.
-
-	    http://www.kernel.org/

Modified: trunk/buildroot/target/device/jp/Config.in
===================================================================
--- trunk/buildroot/target/device/jp/Config.in	2007-09-29 19:47:04 UTC (rev 20122)
+++ trunk/buildroot/target/device/jp/Config.in	2007-09-29 19:52:03 UTC (rev 20123)
@@ -9,10 +9,3 @@
 comment "Package support"
 	depends BR2_TARGET_Q5
 
-config BR2_PACKAGE_LINUX
-	bool "linux"
-	default n
-	depends BR2_TARGET_Q5
-	help
-	    The Linux kernel.
-	    http://www.kernel.org/
