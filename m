From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:27:01 +0200
Subject: [Buildroot] [git commit] configs: mx53loco: Extend to ext4 type
Message-ID: <20160601161312.1AE3381F53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97aed09d375b617dc9ba5990d6dd66b5498b8353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for EXT4 filesystem.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 06150c7..e461f7a 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -13,6 +13,7 @@ BR2_GLOBAL_PATCH_DIR="board/freescale/imx53loco/patches/"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
