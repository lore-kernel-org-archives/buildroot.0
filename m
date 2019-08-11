From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 11 Aug 2019 06:50:00 -0300
Subject: [Buildroot] [PATCH] configs/toradex_apalis_imx6_defconfig: Bump
 kernel version
Message-ID: <20190811095000.15574-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump kernel to version 4.9.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/269139299

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 configs/toradex_apalis_imx6_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/toradex_apalis_imx6_defconfig b/configs/toradex_apalis_imx6_defconfig
index b7ef98049276..40a2d2d520d9 100644
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
-- 
2.17.1
