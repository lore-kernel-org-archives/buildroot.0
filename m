From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:22:19 +0200
Subject: [Buildroot] [git commit] configs/toradex_apalis_imx6_defconfig:
 Bump kernel version
Message-ID: <20190811121911.82B358869B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e7e3d888eeace8d189df17af3fcc1218f83936f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump kernel to version 4.9.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139299

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/toradex_apalis_imx6_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/toradex_apalis_imx6_defconfig b/configs/toradex_apalis_imx6_defconfig
index b7ef980492..40a2d2d520 100644
--- a/configs/toradex_apalis_imx6_defconfig
+++ b/configs/toradex_apalis_imx6_defconfig
@@ -1,15 +1,15 @@
 BR2_arm=y
 BR2_cortex_a9=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/toradex/apalis-imx6/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.toradex.com/linux-toradex.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="18717e2b1ca9b0fbf8bafa2717719e1f2c8f1114"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d899927728beca8357a5b4120b690cb3c1d80844"
 BR2_LINUX_KERNEL_DEFCONFIG="apalis_imx6"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora imx6q-apalis_v1_0-eval imx6q-apalis_v1_0-ixora"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-apalis-eval imx6q-apalis-ixora imx6q-apalis-ixora-v1.1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
