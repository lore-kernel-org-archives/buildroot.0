From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Thu, 22 Sep 2016 10:54:10 -0300
Subject: [Buildroot] [PATCH 2/2] configs/imx6qsabresd: Add ext4 rootfs option
In-Reply-To: <1474552450-29870-1-git-send-email-fabio.estevam@nxp.com>
References: <1474552450-29870-1-git-send-email-fabio.estevam@nxp.com>
Message-ID: <1474552450-29870-2-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow building a ext4 rootfs type.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/freescale_imx6qsabresd_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index fc465a2..4191e99 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # required tools to create the microSD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
