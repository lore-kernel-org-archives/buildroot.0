From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Thu, 24 Oct 2019 19:29:43 +0200
Subject: [Buildroot] [PATCH 2/2] configs/stm32mp157_dk_defconfig: switch to
 mainline 2019.07 U-Boot version
In-Reply-To: <20191024172943.31907-1-b.bilas@grinn-global.com>
References: <20191024172943.31907-1-b.bilas@grinn-global.com>
Message-ID: <20191024172943.31907-2-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to the official U-Boot repository since
the board has been officially supported.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/stm32mp157_dk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/stm32mp157_dk_defconfig b/configs/stm32mp157_dk_defconfig
index 65876a795b..5ff25743ca 100644
--- a/configs/stm32mp157_dk_defconfig
+++ b/configs/stm32mp157_dk_defconfig
@@ -18,8 +18,8 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,STMicroelectronics,u-boot,v2018.11-stm32mp-r2.5)/u-boot-v2018.11-stm32mp-r2.5.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32mp157-dk/uboot-fragment.config"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.23.0
