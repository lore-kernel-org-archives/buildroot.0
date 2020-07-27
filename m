From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 27 Jul 2020 17:19:36 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32mp157a_dk1: Bump Kernel and
 U-Boot
Message-ID: <1595863177-19305-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel to version 5.7.10 and U-Boot to 2020.07

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 configs/stm32mp157a_dk1_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index ad10408..be5ea75 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157a-dk1/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.7.4
