From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 22 Oct 2019 19:35:10 +0200
Subject: [Buildroot] [PATCH 1/2] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.2
Message-ID: <1571765711-31811-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit :
	- bumps Linux & U-Boot to linux4sam_6.2
	- bumps at91bootstrap to v3.9.0

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

update

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index 7709e1e..1d16708 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/atmel/sama5d27_som1_ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.1)/linux-linux4sam_6.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,linux-at91,linux4sam_6.2)/linux-linux4sam_6.2.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d27_som1_ek"
@@ -72,13 +72,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.13"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.9.0"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.1"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d27_som1_ek_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
