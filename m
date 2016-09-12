From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Sep 2016 17:50:47 -0300
Subject: [Buildroot] [PATCH 2/3] wandboard: Bump to U-Boot 2016.09
In-Reply-To: <1473713448-32466-1-git-send-email-festevam@gmail.com>
References: <1473713448-32466-1-git-send-email-festevam@gmail.com>
Message-ID: <1473713448-32466-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/wandboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 67041a6..18d30d9 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.7.4
