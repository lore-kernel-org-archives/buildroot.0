From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 21:16:47 +0200
Subject: [Buildroot] [git commit] configs/stm32mp157c_dk2: Bump Kernel and
 U-Boot
Message-ID: <20200727191156.77BC681F88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6a2f7a8462d10d14d51f0dcb1bc8358bce47a76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 5.7.10 and U-Boot to 2020.07

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Tested-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32mp157c_dk2_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index ca72049cb2..86e1551a30 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -6,7 +6,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/common/stm32mp157/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157c-dk2/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O ^metadata_csum"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157c-dk2/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
