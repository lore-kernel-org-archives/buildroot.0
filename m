From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:45:37 +0100
Subject: [Buildroot] [git commit] package/freescale-imx:
 BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU is also true on i.MX8X
Message-ID: <20200203223458.A02308911C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b3c48ed8107c5cd39f5d761734964dcd8c8d408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow to select the imx-gpu-viv package on i.MX8X.

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
