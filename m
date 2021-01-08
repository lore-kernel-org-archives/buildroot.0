From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2021 08:43:46 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/freescale-imx/firmware-imx: add sdma file for IMX6S platform
Message-ID: <20210108073947.8BBCE83E5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0edfd226bd9cf3713c93a8551beaf7d779078497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Uses the same file as IMX6Q platform, see imx6sl.dtsi.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4a511166c8dfd3d7862da771ae1120fb2f09e8bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 587f402426..d49241bff8 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
