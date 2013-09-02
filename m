From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 02 Sep 2013 22:07:57 +0200
Subject: [Buildroot] [PATCH 8 of 9 v4] defconfigs: update after rename of
 custom git repo/version options
In-Reply-To: <patchbomb.1378152469@argentina>
References: <patchbomb.1378152469@argentina>
Message-ID: <47fcf0e281a6bd9a3f94.1378152477@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: no changes
(v3): new patch in this series (comment Arnout)

 configs/arm_foundationv8_defconfig |  4 ++--
 configs/beaglebone_defconfig       |  4 ++--
 configs/calao_snowball_defconfig   |  4 ++--
 configs/cubieboard_defconfig       |  8 ++++----
 configs/ea3250_defconfig           |  8 ++++----
 configs/fdi3250_defconfig          |  8 ++++----
 configs/gnublin_defconfig          |  8 ++++----
 configs/mx53loco_defconfig         |  8 ++++----
 configs/phy3250_defconfig          |  8 ++++----
 configs/rpi_defconfig              |  4 ++--
 10 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -8,8 +8,8 @@ BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="vex
 BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS="root=/dev/vda consolelog=9 console=ttyAMA0 rw"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.linaro.org/kernel/linaro-aarch64.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="7181edd0539e195f78adedbb6c3878f9f1e0c4bb"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.linaro.org/kernel/linaro-aarch64.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7181edd0539e195f78adedbb6c3878f9f1e0c4bb"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -30,8 +30,8 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="935f6c2f82056d538b528272e2bdbb5c08d69a58"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935f6c2f82056d538b528272e2bdbb5c08d69a58"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.8.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/calao_snowball_defconfig b/configs/calao_snowball_defconfig
--- a/configs/calao_snowball_defconfig
+++ b/configs/calao_snowball_defconfig
@@ -16,8 +16,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="snowball"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/igloocommunity/igloo-kernel"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="stable-linux-ux500-3.4"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/igloocommunity/igloo-kernel"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="stable-linux-ux500-3.4"
 BR2_LINUX_KERNEL_PATCH="board/calao/snowball/"
 BR2_LINUX_KERNEL_DEFCONFIG="u8500"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
--- a/configs/cubieboard_defconfig
+++ b/configs/cubieboard_defconfig
@@ -22,8 +22,8 @@ BR2_KERNEL_HEADERS_3_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="274a66a7bfcbaabb88d63e4eba161965383cc416"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="274a66a7bfcbaabb88d63e4eba161965383cc416"
 BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
 BR2_LINUX_KERNEL_DEFCONFIG="sun4i"
 
@@ -32,8 +32,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cubieboard"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_VERSION="sunxi"
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="1a8ac55429f7f8cc9f100c1cf2dc0195cf81e76f"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="1a8ac55429f7f8cc9f100c1cf2dc0195cf81e76f"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
diff --git a/configs/ea3250_defconfig b/configs/ea3250_defconfig
--- a/configs/ea3250_defconfig
+++ b/configs/ea3250_defconfig
@@ -27,8 +27,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="ea3250"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_VERSION="master"
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_LPC32XXCDL=y
 BR2_TARGET_LPC32XXCDL_BOARDNAME="ea3250"
@@ -39,8 +39,8 @@ BR2_TARGET_LPC32XXCDL_BOARDNAME="ea3250"
 #
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
 BR2_LINUX_KERNEL_VERSION="master"
 BR2_LINUX_KERNEL_PATCH=""
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
diff --git a/configs/fdi3250_defconfig b/configs/fdi3250_defconfig
--- a/configs/fdi3250_defconfig
+++ b/configs/fdi3250_defconfig
@@ -27,8 +27,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="fdi3250"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_VERSION="master"
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_LPC32XXCDL=y
 BR2_TARGET_LPC32XXCDL_BOARDNAME="fdi3250"
@@ -39,8 +39,8 @@ BR2_TARGET_LPC32XXCDL_BOARDNAME="fdi3250
 #
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
 BR2_LINUX_KERNEL_VERSION="master"
 BR2_LINUX_KERNEL_PATCH=""
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
--- a/configs/gnublin_defconfig
+++ b/configs/gnublin_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_BLOCKS=475000
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="GNUBLIN"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="2009.11_gnublin_support_v2"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://gitorious.org/u-boot-gnublin-support/u-boot-gnublin-support.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2009.11_gnublin_support_v2"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="v3.7-gnublin-2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://gitorious.org/linux-3-7-gnublin/linux-3-7-gnublin.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="v3.7-gnublin-2"
 BR2_LINUX_KERNEL_DEFCONFIG="gnublin"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -8,8 +8,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx53_loco"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_2.6.35_11.09.01"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -17,6 +17,6 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_2.6.35_11.09.01"
 BR2_LINUX_KERNEL_DEFCONFIG="imx5"
diff --git a/configs/phy3250_defconfig b/configs/phy3250_defconfig
--- a/configs/phy3250_defconfig
+++ b/configs/phy3250_defconfig
@@ -27,8 +27,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="phy3250"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_VERSION="master"
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="master"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.lpclinux.com/uboot-2009.03-lpc32xx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="master"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_LPC32XXCDL=y
 BR2_TARGET_LPC32XXCDL_BOARDNAME="phy3250"
@@ -39,8 +39,8 @@ BR2_TARGET_LPC32XXCDL_BOARDNAME="phy3250
 #
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="master"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.lpclinux.com/linux-2.6.34-lpc32xx"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
 BR2_LINUX_KERNEL_VERSION="master"
 BR2_LINUX_KERNEL_PATCH=""
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -16,8 +16,8 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="0006326"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0006326"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
