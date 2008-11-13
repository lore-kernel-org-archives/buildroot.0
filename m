From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 13 Nov 2008 20:07:25 +0100
Subject: [Buildroot] [PATCH] linux: remove unused BR2_LINUX_BOARD_PATCH
Message-ID: <200811132007.25253.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 .../Atmel/at91rm9200df/at91rm9200df_defconfig      |    1 -
 .../Atmel/at91sam9260dfc/at91sam9260dfc_defconfig  |    1 -
 .../Atmel/at91sam9261ek/at91sam9261ek_defconfig    |    1 -
 .../Atmel/at91sam9263ek/at91sam9263ek_defconfig    |    1 -
 .../Atmel/atngw100-base/atngw100-base_defconfig    |    1 -
 .../atngw100-expanded/atngw100-expanded_defconfig  |    1 -
 target/device/Atmel/atngw100/atngw100_defconfig    |    1 -
 target/device/Atmel/atstk100x/atstk100x_defconfig  |    1 -
 target/device/KwikByte/kb9202/kb9202_defconfig     |    1 -
 target/linux/Config.in.advanced                    |    4 ----
 10 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
index 12bcc17..2dd0269 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
@@ -869,7 +869,6 @@ BR2_ARCH_AT91_2_6_24=y
 # BR2_ARCH_AT91_2_6_20_4 is not set
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 # BR2_KERNEL_PREPATCHED is not set
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
index c1e8650..7b2f59c 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
@@ -799,7 +799,6 @@ BR2_ARCH_AT91_2_6_24=y
 # BR2_ARCH_AT91_2_6_20_4 is not set
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 # BR2_KERNEL_PREPATCHED is not set
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
index 0c25f99..43aaef8 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
@@ -777,7 +777,6 @@ BR2_ARCH_AT91_2_6_24=y
 # BR2_ARCH_AT91_2_6_20_4 is not set
 BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
 BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
index 8e34225..a16c3a9 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
@@ -744,7 +744,6 @@ BR2_LINUX_2_6_22_1=y
 # Patches
 #
 # BR2_KERNEL_ADD_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PREPATCHED=y
 # BR2_KERNEL_BASE is not set
diff --git a/target/device/Atmel/atngw100-base/atngw100-base_defconfig b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
index 6c7e7f2..aacac6f 100644
--- a/target/device/Atmel/atngw100-base/atngw100-base_defconfig
+++ b/target/device/Atmel/atngw100-base/atngw100-base_defconfig
@@ -574,7 +574,6 @@ BR2_ARCH_AVR32_2_6_24=y
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
diff --git a/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig b/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
index 82cef2b..66e351b 100644
--- a/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
+++ b/target/device/Atmel/atngw100-expanded/atngw100-expanded_defconfig
@@ -1078,7 +1078,6 @@ BR2_ARCH_AVR32_2_6_24=y
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
diff --git a/target/device/Atmel/atngw100/atngw100_defconfig b/target/device/Atmel/atngw100/atngw100_defconfig
index 433c90e..17f9a5b 100644
--- a/target/device/Atmel/atngw100/atngw100_defconfig
+++ b/target/device/Atmel/atngw100/atngw100_defconfig
@@ -703,7 +703,6 @@ BR2_ARCH_AVR32_2_6_24=y
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
diff --git a/target/device/Atmel/atstk100x/atstk100x_defconfig b/target/device/Atmel/atstk100x/atstk100x_defconfig
index 258b6ff..158bca6 100644
--- a/target/device/Atmel/atstk100x/atstk100x_defconfig
+++ b/target/device/Atmel/atstk100x/atstk100x_defconfig
@@ -902,7 +902,6 @@ BR2_ARCH_AVR32_2_6_24=y
 # BR2_LINUX_AVR32_ISI_PATCH is not set
 # BR2_LINUX_AVR32_AC97_PATCH is not set
 # BR2_LINUX_AVR32_PSIF_PATCH is not set
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 BR2_KERNEL_PATCH="patch-$(BR2_DOWNLOAD_LINUX26_VERSION).$(BR2_KERNEL_PATCH_LEVEL).bz2"
 BR2_EXTRA_VERSION=".$(BR2_KERNEL_PATCH_LEVEL)"
diff --git a/target/device/KwikByte/kb9202/kb9202_defconfig b/target/device/KwikByte/kb9202/kb9202_defconfig
index 0d46c5f..6ec31d3 100644
--- a/target/device/KwikByte/kb9202/kb9202_defconfig
+++ b/target/device/KwikByte/kb9202/kb9202_defconfig
@@ -726,7 +726,6 @@ BR2_LINUX_2_6_24=y
 # BR2_KERNEL_ADD_KERNEL_ORG_PATCH is not set
 # BR2_KERNEL_ADD_PATCH is not set
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
-BR2_LINUX_BOARD_PATCH=y
 BR2_LINUX_BSP_PATCH=""
 # BR2_KERNEL_PREPATCHED is not set
 BR2_KERNEL_BASE=y
diff --git a/target/linux/Config.in.advanced b/target/linux/Config.in.advanced
index 798a662..beb942b 100644
--- a/target/linux/Config.in.advanced
+++ b/target/linux/Config.in.advanced
@@ -347,10 +347,6 @@ config BR2_KERNEL_MM_LEVEL
 
 source "target/device/Config.in.linux.patches"
 
-config BR2_LINUX_BOARD_PATCH
-	bool "Add board specific patch"
-	default y
-
 config BR2_LINUX_BSP_PATCH
 	string "Additional patch to apply (from \$(DL_DIR))"
 	default ""
-- 
1.6.0.4.620.g87fa
