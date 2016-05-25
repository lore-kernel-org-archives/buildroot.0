From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 May 2016 17:16:07 -0300
Subject: [Buildroot] [PATCH 2/3] configs: mx53loco: Extend to ext4 type
In-Reply-To: <1464207368-22532-1-git-send-email-festevam@gmail.com>
References: <1464207368-22532-1-git-send-email-festevam@gmail.com>
Message-ID: <1464207368-22532-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for EXT4 filesystem.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
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
-- 
1.9.1
