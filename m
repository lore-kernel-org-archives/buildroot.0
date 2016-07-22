From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Jul 2016 21:41:55 -0300
Subject: [Buildroot] [PATCH] warpbboard: Bump to U-Boot 2016.07
Message-ID: <1469148115-29023-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

U-Boot 2016.07 works well on warpboard, so bump to this version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/warpboard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index d3cffb9..8dfe52e 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -31,7 +31,7 @@ BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.07"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # host utility
-- 
1.9.1
