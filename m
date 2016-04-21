From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Apr 2016 22:20:01 +0200
Subject: [Buildroot] [git commit] configs: atmel: xplained boards: bump to
	linux4sam_5.3
Message-ID: <20160421202007.7621E8026B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e6ffe9264f578076b6a6ffb3559776c2ebc26a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump defconfigs relative to Xplained boards to linux4sam_5.3 release. It
involves to use at91bootstrap v3.8.5.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atmel_sama5d2_xplained_mmc_defconfig | 6 +++---
 configs/atmel_sama5d3_xplained_defconfig     | 6 +++---
 configs/atmel_sama5d3_xplained_mmc_defconfig | 6 +++---
 configs/atmel_sama5d4_xplained_defconfig     | 6 +++---
 configs/atmel_sama5d4_xplained_mmc_defconfig | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index 78baf47..7eb969f 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d2_xplained_mmc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained at91-sama5d2_xplained_pda4 at91-sama5d2_xplained_pda7 at91-sama5d2_xplained_pda7b"
@@ -17,13 +17,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.5"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_xplained_mmc"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index 0ab5799..4eb5304 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -6,7 +6,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
@@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.5"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_nandflash"
 BR2_PACKAGE_HOST_SAM_BA=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index fc2f5d9..14ca3f5 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d3_xplained_mmc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d3_xplained at91-sama5d3_xplained_pda4 at91-sama5d3_xplained_pda7 at91-sama5d3_xplained_pda7b"
@@ -16,13 +16,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.5"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d3_xplained_mmc"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 48ef699..ad4bff1 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -7,7 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
@@ -21,12 +21,12 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.5"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_nandflash"
 BR2_PACKAGE_HOST_SAM_BA=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index 1db660d..5f0b748 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/atmel/sama5d4_xplained_mmc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
@@ -17,13 +17,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.5"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.3"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_mmc"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
