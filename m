From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Fri, 28 Mar 2008 14:03:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/ARMLTD targ etc...
Message-ID: <20080328210305.9A5EF3C3B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-28 14:03:04 -0700 (Fri, 28 Mar 2008)
New Revision: 21540

Log:
* Bumped GCC to 4.2.2, removed 4.2.0


Modified:
   trunk/buildroot/.defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002-no-mplayer_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/target/device/valka/v100sc2_defconfig
   trunk/buildroot/target/device/x86/i386/i686_defconfig
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/.defconfig
===================================================================
--- trunk/buildroot/.defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/.defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -133,7 +133,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -191,12 +191,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -196,12 +196,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -172,12 +172,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -166,7 +166,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -227,12 +227,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -177,7 +177,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -239,12 +239,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -183,7 +183,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -244,12 +244,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -180,7 +180,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -241,12 +241,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -132,7 +132,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -190,11 +190,11 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 # BR2_TOOLCHAIN_SYSROOT is not set
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -132,7 +132,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -190,11 +190,11 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 # BR2_TOOLCHAIN_SYSROOT is not set
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -132,7 +132,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -190,8 +190,8 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.1"

Modified: trunk/buildroot/target/device/Atmel/atstk1002/atstk1002-no-mplayer_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/atstk1002-no-mplayer_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/atstk1002-no-mplayer_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -132,7 +132,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -190,11 +190,11 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 # BR2_TOOLCHAIN_SYSROOT is not set
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -132,7 +132,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -190,11 +190,11 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 # BR2_TOOLCHAIN_SYSROOT is not set
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-03-28 21:03:04 UTC (rev 21540)
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 if BR2_avr32
+	default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2 if BR2_avr32
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
@@ -16,16 +16,16 @@
 	help
 	  The gcc-4.1.2 toolchain for the AVR32
 
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
-	bool "Use prepatched source for AVR32 gcc-4.2.1 toolchain"
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	bool "Use prepatched source for AVR32 gcc-4.2.2 toolchain"
 	depends on BR2_avr32
-	select BR2_EXT_GCC_VERSION_4_2_1
+	select BR2_EXT_GCC_VERSION_4_2_2
 	select BR2_EXT_BINUTILS_VERSION_2_17
 	select BR2_EXT_UCLIBC_VERSION_0_9_29
 	select BR2_TOOLCHAIN_ATMEL_AVR32
 	help
-	  The gcc-4.2.1 toolchain for the AVR32
-	  * gcc-4.2.1
+	  The gcc-4.2.2 toolchain for the AVR32
+	  * gcc-4.2.2
 	  * binutils-2.17
 	  * uClibc-0.9.29
 	  * gdb-6.4
@@ -57,7 +57,7 @@
 config BR2_VENDOR_GCC_RELEASE
 	string
 	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
 
 config BR2_VENDOR_UCLIBC_RELEASE
 	string
@@ -110,7 +110,7 @@
 	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
-config	BR2_EXT_GCC_VERSION_4_2_1
+config	BR2_EXT_GCC_VERSION_4_2_2
 	bool
 	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE

Modified: trunk/buildroot/target/device/valka/v100sc2_defconfig
===================================================================
--- trunk/buildroot/target/device/valka/v100sc2_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/valka/v100sc2_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -109,7 +109,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -167,11 +167,11 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/target/device/x86/i386/i686_defconfig
===================================================================
--- trunk/buildroot/target/device/x86/i386/i686_defconfig	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/target/device/x86/i386/i686_defconfig	2008-03-28 21:03:04 UTC (rev 21540)
@@ -140,7 +140,7 @@
 # BR2_TOOLCHAIN_EXTERNAL_SOURCE is not set
 BR2_TOOLCHAIN_SOURCE=y
 BR2_EXT_GCC_VERSION_4_1_2=y
-BR2_EXT_GCC_VERSION_4_2_1=y
+BR2_EXT_GCC_VERSION_4_2_2=y
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 BR2_EXT_UCLIBC_VERSION_0_9_28_3=y
@@ -198,12 +198,12 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-# BR2_GCC_VERSION_4_2_0 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_IS_SNAP is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2008-03-28 17:49:31 UTC (rev 21539)
+++ trunk/buildroot/toolchain/gcc/Config.in	2008-03-28 21:03:04 UTC (rev 21540)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_2_1 if !BR2_avr32
+	default BR2_GCC_VERSION_4_2_2 if !BR2_avr32
 	default BR2_GCC_VERSION_4_1_2 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
@@ -23,16 +23,16 @@
 		depends BR2_EXT_GCC_VERSION_4_1_2
 		bool "gcc 4.1.2"
 
-	config BR2_GCC_VERSION_4_2_0
-		depends !BR2_avr32 && !BR2_nios2
-		depends BR2_DEPRECATED || BR2_RECENT
-		bool "gcc 4.2.0"
-
 	config BR2_GCC_VERSION_4_2_1
 		depends !BR2_nios2
-		depends BR2_EXT_GCC_VERSION_4_2_1
+		depends BR2_DEPRECATED || BR2_RECENT
 		bool "gcc 4.2.1"
 
+	config BR2_GCC_VERSION_4_2_2
+		depends !BR2_nios2
+		depends BR2_EXT_GCC_VERSION_4_2_2
+		bool "gcc 4.2.2"
+
 #	config BR2_GCC_VERSION_4_3
 #		depends !BR2_avr32 && !BR2_nios2
 #		select BR2_GCC_IS_SNAP
@@ -52,9 +52,12 @@
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_0 || BR2_GCC_VERSION_4_2_1
-	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_0 && !BR2_GCC_VERSION_4_2_1
+	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_1 \
+		|| BR2_GCC_VERSION_4_2_2
+	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 \
+		&& !BR2_GCC_VERSION_4_2_2
 
+
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
 	default "20070921"
@@ -68,8 +71,8 @@
 	default "3.4.6"     if BR2_GCC_VERSION_3_4_6
 	default "4.0.4"     if BR2_GCC_VERSION_4_0_4
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
-	default "4.2.0"     if BR2_GCC_VERSION_4_2_0
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
+	default "4.2.2"     if BR2_GCC_VERSION_4_2_2
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
