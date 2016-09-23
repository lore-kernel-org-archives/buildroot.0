From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 23 Sep 2016 09:47:17 -0300
Subject: [Buildroot] [PATCH 4/4] configs/imx6dlsabreauto: Add ext4 rootfs
	option
In-Reply-To: <1474634837-5756-1-git-send-email-festevam@gmail.com>
References: <1474634837-5756-1-git-send-email-festevam@gmail.com>
Message-ID: <1474634837-5756-4-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Allow building a ext4 rootfs type.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 402d9c0..8eb3632 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -23,6 +23,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
 # filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # required tools to create the microSD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.7.4
