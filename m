From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:50:16 +0200
Subject: [Buildroot] [git commit] configs/imx8mqevk_defconfig: add missing
 kernel headers version setting
Message-ID: <20200920134114.673B2869F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b9c9c7487278f2afd246902dd2c79f348779d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx8mqevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx8mqevk_defconfig b/configs/imx8mqevk_defconfig
index 1981fa06c8..73f3f3dcc5 100644
--- a/configs/imx8mqevk_defconfig
+++ b/configs/imx8mqevk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mq-evk.dtb"
