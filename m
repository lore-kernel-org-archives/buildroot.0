From: Min Xu <xuminready@gmail.com>
Date: Mon, 14 Dec 2020 19:23:21 +0000
Subject: [Buildroot] [PATCH 2/2] Defconfigs: fix rock64_defconfig
In-Reply-To: <20201214192321.9987-1-xuminready@gmail.com>
References: <20201214192321.9987-1-xuminready@gmail.com>
Message-ID: <20201214192321.9987-2-xuminready@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Min Xu <xuminready@gmail.com>
---
 configs/rock64_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
index 30bf12c061..df03e357e2 100644
--- a/configs/rock64_defconfig
+++ b/configs/rock64_defconfig
@@ -17,16 +17,16 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v1.4"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3328"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/*.elf"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2017.09-rockchip-ayufan-1035-gd646df03ac"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ayufan-rock64/linux-mainline-u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="release-2020-07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock64-rk3328"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-- 
2.20.1
