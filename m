From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 21:45:38 +0100
Subject: [Buildroot] [git commit] olimex_a20_olinuxino_micro: remove
	redundant defconfig lines
Message-ID: <20160302202757.4A0C27F98B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad009b6b95d9f0c67d6027247008d2baf422c8e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These defconfig options are set to their default values, so they are
redundant and can be removed without effect.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_a20_olinuxino_micro_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 420252c..f84da34 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -1,7 +1,6 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
 # Linux headers same as kernel, a 4.4 series
@@ -10,7 +9,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
-BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino/post-build.sh"
@@ -20,7 +18,6 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/b
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.2"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -38,7 +35,6 @@ BR2_TARGET_UBOOT_BOARDNAME="A20-OLinuXino_MICRO"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
