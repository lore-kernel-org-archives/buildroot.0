From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Sep 2017 08:59:45 -0300
Subject: [Buildroot] [PATCH 3/6] configs/imx6q-sabresd-qt5: Increase the
	rootfs size
In-Reply-To: <1506340788-9662-1-git-send-email-festevam@gmail.com>
References: <1506340788-9662-1-git-send-email-festevam@gmail.com>
Message-ID: <1506340788-9662-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The QT5 rootfs requires more space, so adjust it a larger size.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6q-sabresd_qt5_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6q-sabresd_qt5_defconfig b/configs/imx6q-sabresd_qt5_defconfig
index 94bf867..3128555 100644
--- a/configs/imx6q-sabresd_qt5_defconfig
+++ b/configs/imx6q-sabresd_qt5_defconfig
@@ -23,7 +23,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="320M"
 BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 
 # Bootloader
-- 
2.7.4
