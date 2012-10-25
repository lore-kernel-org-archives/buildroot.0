From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Fri, 26 Oct 2012 00:15:33 +0200
Subject: [Buildroot] [PATCH 3/3] at91sam92*: update defconfigs to use latest
	u-boot
In-Reply-To: <1351203333-26588-1-git-send-email-alexandre.belloni@piout.net>
References: <1351203333-26588-1-git-send-email-alexandre.belloni@piout.net>
Message-ID: <1351203333-26588-4-git-send-email-alexandre.belloni@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
---
 configs/at91sam9260dfc_defconfig |    6 ------
 configs/at91sam9261ek_defconfig  |    6 ------
 configs/at91sam9263ek_defconfig  |    6 ------
 3 files changed, 18 deletions(-)

diff --git a/configs/at91sam9260dfc_defconfig b/configs/at91sam9260dfc_defconfig
index 921afa8..085997a 100644
--- a/configs/at91sam9260dfc_defconfig
+++ b/configs/at91sam9260dfc_defconfig
@@ -9,17 +9,11 @@ BR2_PACKAGE_HOST_SAM_BA=y
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9260ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASH=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91sam9260ek_dataflash_cs0"
-BR2_TARGET_UBOOT_2011_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9260"
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/at91sam9261ek_defconfig b/configs/at91sam9261ek_defconfig
index aafb166..c53e732 100644
--- a/configs/at91sam9261ek_defconfig
+++ b/configs/at91sam9261ek_defconfig
@@ -9,17 +9,11 @@ BR2_PACKAGE_HOST_SAM_BA=y
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9261ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASH=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91sam9261ek_dataflash_cs0"
-BR2_TARGET_UBOOT_2011_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9261"
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/at91sam9263ek_defconfig b/configs/at91sam9263ek_defconfig
index 2cd82c0..208e057 100644
--- a/configs/at91sam9263ek_defconfig
+++ b/configs/at91sam9263ek_defconfig
@@ -9,17 +9,11 @@ BR2_PACKAGE_HOST_SAM_BA=y
 # First stage bootloader
 BR2_TARGET_AT91BOOTSTRAP=y
 BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9263ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASH=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91sam9263ek_dataflash_cs0"
-BR2_TARGET_UBOOT_2011_12=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9263"
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
-- 
1.7.9.5
