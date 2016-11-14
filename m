From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Nov 2016 15:26:25 -0200
Subject: [Buildroot] [PATCH 3/3] configs/warp7: Bump to U-Boot 2016.11
In-Reply-To: <1479144385-27214-1-git-send-email-festevam@gmail.com>
References: <1479144385-27214-1-git-send-email-festevam@gmail.com>
Message-ID: <1479144385-27214-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/warp7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index a55a504..fca7a1d 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -25,7 +25,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="warp7_secure"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.11"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # wifi firmware for brcm43430
-- 
2.7.4
