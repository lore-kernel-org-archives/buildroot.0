From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 23 Dec 2020 15:01:24 +0100
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: add sdma
 file for IMX6S platform
Message-ID: <20201223140124.426856-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses the same file as IMX6Q platform, see imx6sl.dtsi.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index fcf22c55b3..8810779799 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
-- 
2.29.2
