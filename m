From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:01:12 +0200
Subject: [Buildroot] [git commit] configs: beaglebone: bump kernel and uboot
 version
Message-ID: <20191011195534.8880E8D41E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6dd1a07e9d7cd119011e60607312a5575a3534b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to Linux kernel version 4.19.38 from the TI SDK 06.00.00.07
(TI SDK release date: 7.8.2019)
Added beaglebone blue
Updated uboot to version 2019.07

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/beaglebone_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index fbb259f577..d88b4253ef 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,21 +1,21 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4796173fc58688055a99a1cef19a839174067220"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4dae378bbe721277b08699d1d88ffae12acc9b09"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
