From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 08:09:01 +0100
Subject: [Buildroot] [git commit] defconfigs: update after rename of custom
	git repo/version options
Message-ID: <20131027072650.E2BD09BB81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0a4de053eae448757a00398d853377562228850
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also update cubieboard2, freescale_imx6* and wandboard]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/arm_foundationv8_defconfig          |    4 ++--
 configs/beaglebone_defconfig                |    4 ++--
 configs/calao_snowball_defconfig            |    4 ++--
 configs/cubieboard2_defconfig               |    8 ++++----
 configs/cubieboard_defconfig                |    8 ++++----
 configs/ea3250_defconfig                    |    8 ++++----
 configs/fdi3250_defconfig                   |    8 ++++----
 configs/freescale_imx6sabresd_defconfig     |    8 ++++----
 configs/freescale_imx6sololiteevk_defconfig |    8 ++++----
 configs/gnublin_defconfig                   |    8 ++++----
 configs/mx53loco_defconfig                  |    8 ++++----
 configs/phy3250_defconfig                   |    8 ++++----
 configs/rpi_defconfig                       |    4 ++--
 configs/wandboard_defconfig                 |    8 ++++----
 14 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index 7a50b1a..c8de16d 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -8,8 +8,8 @@ BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="vexpress-foundation-v8"
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
index d6b5c31..97b4b0b 100644
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
index 90421a4..4c30a6b 100644
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
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 9f60b9f..f85760d 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -22,8 +22,8 @@ BR2_KERNEL_HEADERS_3_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="5dda5145c877335e17bd9ca48954841acc0f785a"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5dda5145c877335e17bd9ca48954841acc0f785a"
 BR2_LINUX_KERNEL_VERSION="sunxi-3.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/cubietech/cubieboard/linux-cubieboard2.config"
@@ -33,8 +33,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="cubieboard2"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_VERSION="sunxi"
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="b4bca5e0651b460a4511582f07a935cb48f74948"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b4bca5e0651b460a4511582f07a935cb48f74948"
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
diff --git a/configs/cubieboard_defconfig b/configs/cubieboard_defconfig
index 933c1a2..1da019f 100644
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
index 2574dde..b7ce18b 100644
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
index b1c6684..b7f6ad7 100644
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
@@ -39,8 +39,8 @@ BR2_TARGET_LPC32XXCDL_BOARDNAME="fdi3250"
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
diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6sabresd_defconfig
index b030eee..368e00b 100644
--- a/configs/freescale_imx6sabresd_defconfig
+++ b/configs/freescale_imx6sabresd_defconfig
@@ -8,8 +8,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx6"
 
 # filesystem
@@ -19,5 +19,5 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabresd"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 997ecbe..997d44f 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -8,8 +8,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx6s"
 
 # filesystem
@@ -19,5 +19,5 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sl_evk"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
diff --git a/configs/gnublin_defconfig b/configs/gnublin_defconfig
index efafe06..acb4551 100644
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
index 08de3da..8b12238 100644
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
index e95546f..fe49653 100644
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
@@ -39,8 +39,8 @@ BR2_TARGET_LPC32XXCDL_BOARDNAME="phy3250"
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
index 2b19673..da877fb 100644
--- a/configs/rpi_defconfig
+++ b/configs/rpi_defconfig
@@ -16,8 +16,8 @@ BR2_DEFAULT_KERNEL_VERSION="3.6.11"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="1587f77"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1587f77"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index ca4ce87..996a70a 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -7,8 +7,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard_dl"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.denx.de/u-boot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="326ea986ac150acdc7656d57fca647db80b50158"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="326ea986ac150acdc7656d57fca647db80b50158"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
 BR2_TARGET_UBOOT_ENVIMAGE=y
@@ -16,7 +16,7 @@ BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
 BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://repo.or.cz/wandboard.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="86429847b5152f040f190015faedcac49b243328"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://repo.or.cz/wandboard.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="86429847b5152f040f190015faedcac49b243328"
 BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
