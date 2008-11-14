From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 14 Nov 2008 05:39:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target:
	device/Atmel/at91rm9200df device/Atmel/a etc...
Message-ID: <20081114133958.68A593C94C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-14 05:39:58 -0800 (Fri, 14 Nov 2008)
New Revision: 24042

Log:
linux: remove unused BR2_LINUX_BOARD_PATCH

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
   trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
   trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -869,7 +869,6 @@
 # BR2_ARCH_AT91_2_6_20_4 is not set
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 # BR2_KERNEL_PREPATCHED is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -799,7 +799,6 @@
 # BR2_ARCH_AT91_2_6_20_4 is not set
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 # BR2_KERNEL_PREPATCHED is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -777,7 +777,6 @@
 # BR2_ARCH_AT91_2_6_20_4 is not set
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -744,7 +744,6 @@
 # Patches
 #
 # BR2_KERNEL_ADD_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PREPATCHED=y
 # BR2_KERNEL_BASE is not set

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -703,7 +703,6 @@
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y

Modified: trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -574,7 +574,6 @@
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y

Modified: trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -1078,7 +1078,6 @@
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y

Modified: trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -902,7 +902,6 @@
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"

Modified: trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig
===================================================================
--- trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/device/KwikByte/kb9202/kb9202_defconfig	2008-11-14 13:39:58 UTC (rev 24042)
@@ -726,7 +726,6 @@
 # BR2_KERNEL_ADD_KERNEL_ORG_PATCH is not set
 # BR2_KERNEL_ADD_PATCH is not set
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y

Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-11-14 13:39:46 UTC (rev 24041)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-11-14 13:39:58 UTC (rev 24042)
@@ -347,10 +347,6 @@
 
 source "target/device/Config.in.linux.patches"
 
-config BR2_LINUX_BOARD_PATCH
-	bool "Add board specific patch"
-	default y
-
 config BR2_LINUX_BSP_PATCH
 	string "Additional patch to apply (from \$(DL_DIR))"
 	default ""
