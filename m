From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Mon,  3 Feb 2020 22:31:49 +0300
Subject: [Buildroot] [PATCH v2 1/7] enable vivante gpu driver for imx8x
Message-ID: <20200203193155.12657-1-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index f010aab87b..d23bcdbd9a 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -81,7 +81,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
-- 
2.17.1
