From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:28:43 +0200
Subject: [Buildroot] [git commit] configs/imx6q-sabresd-qt5: Increase the
	rootfs size
Message-ID: <20170926222615.AEA8C802D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2d1f8ca03043a614ffa30bc4b61cecea373769b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QT5 rootfs requires more space, so adjust it a larger size.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
