From: Fabio Estevam <festevam@gmail.com>
Date: Wed,  4 Apr 2018 12:38:03 -0300
Subject: [Buildroot] [PATCH 3/3] configs/wandboard: Bump to U-Boot 2018.03
In-Reply-To: <1522856283-17352-1-git-send-email-festevam@gmail.com>
References: <1522856283-17352-1-git-send-email-festevam@gmail.com>
Message-ID: <1522856283-17352-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 1d249c4..406bd11 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -13,7 +13,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.7.4
