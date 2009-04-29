From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 29 Apr 2009 21:25:25 +0000 (UTC)
Subject: [Buildroot] svn commit: [26247] trunk/buildroot/target/device:
	ARMLTD/integrator926 ARMLTD/integrator92 etc...
Message-ID: <20090429212525.BCF99775F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-29 21:25:25 +0000 (Wed, 29 Apr 2009)
New Revision: 26247

Log:
target/device: fix busybox version / .config in defconfigs

Modified:
   trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
   trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
   trunk/buildroot/target/device/x86/i686/i386_defconfig


Changeset:
Modified: trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig	2009-04-29 20:08:19 UTC (rev 26246)
+++ trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconfig	2009-04-29 21:25:25 UTC (rev 26247)
@@ -270,9 +270,9 @@
 # BR2_BUSYBOX_VERSION_1_12_X is not set
 BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig	2009-04-29 20:08:19 UTC (rev 26246)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig	2009-04-29 21:25:25 UTC (rev 26247)
@@ -271,9 +271,9 @@
 # BR2_BUSYBOX_VERSION_1_12_X is not set
 BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2009-04-29 20:08:19 UTC (rev 26246)
+++ trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2009-04-29 21:25:25 UTC (rev 26247)
@@ -236,11 +236,11 @@
 # BR2_BUSYBOX_VERSION_1_5_0 is not set
 # BR2_BUSYBOX_VERSION_1_5_1 is not set
 # BR2_BUSYBOX_VERSION_1_6_0 is not set
-BR2_BUSYBOX_VERSION_1_6_1=y
+BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.6.1"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 

Modified: trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-04-29 20:08:19 UTC (rev 26246)
+++ trunk/buildroot/target/device/Atmel/atstk1005/atstk1005_defconfig	2009-04-29 21:25:25 UTC (rev 26247)
@@ -293,9 +293,9 @@
 # BR2_BUSYBOX_VERSION_1_12_X is not set
 BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 BR2_PACKAGE_BUSYBOX_SKELETON=y
 

Modified: trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
===================================================================
--- trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig	2009-04-29 20:08:19 UTC (rev 26246)
+++ trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig	2009-04-29 21:25:25 UTC (rev 26247)
@@ -263,11 +263,11 @@
 # BR2_BUSYBOX_VERSION_1_7_X is not set
 # BR2_BUSYBOX_VERSION_1_8_X is not set
 # BR2_BUSYBOX_VERSION_1_9_X is not set
-BR2_BUSYBOX_VERSION_1_10_X=y
+BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.10.3"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 

Modified: trunk/buildroot/target/device/x86/i686/i386_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i686/i386_defconfig	2009-04-29 20:08:19 UTC (rev 26246)
+++ trunk/buildroot/target/device/x86/i686/i386_defconfig	2009-04-29 21:25:25 UTC (rev 26247)
@@ -278,9 +278,9 @@
 # BR2_BUSYBOX_VERSION_1_12_X is not set
 BR2_BUSYBOX_VERSION_1_13_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.13.2"
+BR2_BUSYBOX_VERSION="1.13.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
-BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.13.x.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
 # BR2_PACKAGE_BUSYBOX_SKELETON is not set
 
