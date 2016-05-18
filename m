From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 May 2016 16:26:10 -0300
Subject: [Buildroot] [PATCH] configs: remove trailing directory slashes
Message-ID: <1463599570-21602-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They're not necessary and look bad.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/beaglebone_defconfig          | 2 +-
 configs/calao_qil_a9260_defconfig     | 2 +-
 configs/calao_tny_a9g20_lpw_defconfig | 2 +-
 configs/calao_usb_a9263_defconfig     | 2 +-
 configs/calao_usb_a9g20_lpw_defconfig | 2 +-
 configs/qemu_m68k_mcf5208_defconfig   | 2 +-
 configs/stm32f429_disco_defconfig     | 2 +-
 configs/stm32f469_disco_defconfig     | 2 +-
 configs/warpboard_defconfig           | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 3e3281e..be803b9 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -31,7 +31,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
-BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux/"
+BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/calao_qil_a9260_defconfig b/configs/calao_qil_a9260_defconfig
index e59363a..8b76a87 100644
--- a/configs/calao_qil_a9260_defconfig
+++ b/configs/calao_qil_a9260_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_GLOBAL_PATCH_DIR="board/calao/qil-a9260/patches/"
+BR2_GLOBAL_PATCH_DIR="board/calao/qil-a9260/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 # Linux headers same as kernel, a 3.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_4=y
diff --git a/configs/calao_tny_a9g20_lpw_defconfig b/configs/calao_tny_a9g20_lpw_defconfig
index d9c6ba6..5c66d06 100644
--- a/configs/calao_tny_a9g20_lpw_defconfig
+++ b/configs/calao_tny_a9g20_lpw_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_9=y
 
 # bootloaders
 BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/tny-a9g20-lpw/"
+BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/tny-a9g20-lpw"
 BR2_TARGET_AT91BOOTSTRAP_BOARD="tny_a9g20_lpw"
 BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
 BR2_TARGET_BAREBOX=y
diff --git a/configs/calao_usb_a9263_defconfig b/configs/calao_usb_a9263_defconfig
index c87e960..ed6d3cb 100644
--- a/configs/calao_usb_a9263_defconfig
+++ b/configs/calao_usb_a9263_defconfig
@@ -5,7 +5,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/usb-a9263/"
+BR2_TARGET_AT91BOOTSTRAP_CUSTOM_PATCH_DIR="board/calao/usb-a9263"
 BR2_TARGET_AT91BOOTSTRAP_BOARD="usb_a9263"
 BR2_TARGET_AT91BOOTSTRAP_NANDFLASH=y
 BR2_TARGET_BAREBOX=y
diff --git a/configs/calao_usb_a9g20_lpw_defconfig b/configs/calao_usb_a9g20_lpw_defconfig
index 956d007..8a56d06 100644
--- a/configs/calao_usb_a9g20_lpw_defconfig
+++ b/configs/calao_usb_a9g20_lpw_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_arm926t=y
 # Linux headers same as kernel, a 3.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
-BR2_GLOBAL_PATCH_DIR="board/calao/usb-a9g20-lpw/patches/"
+BR2_GLOBAL_PATCH_DIR="board/calao/usb-a9g20-lpw/patches"
 BR2_PACKAGE_HOST_SAM_BA=y
 BR2_TARGET_ROOTFS_UBIFS=y
 BR2_TARGET_AT91BOOTSTRAP=y
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 31db912..dd42dc5 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,7 +9,7 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-BR2_GLOBAL_PATCH_DIR="board/qemu/m68k-mcf5208/patches/"
+BR2_GLOBAL_PATCH_DIR="board/qemu/m68k-mcf5208/patches"
 
 # Linux headers same as kernel, a 4.5 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 987dcb8..3799794 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches/"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index dd14f56..327134d 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_m4=y
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches/"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 798afed..d3cffb9 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/warpboard/patches/"
+BR2_GLOBAL_PATCH_DIR="board/freescale/warpboard/patches"
 
 # Linux headers same as kernel, a 4.0 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
-- 
2.7.3
