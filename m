From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 30 Jul 2015 11:41:28 +0300
Subject: [Buildroot] [PATCH] firmware-imx: update package description
Message-ID: <c319870a042c9f4d754de813123d3bab94a7690f.1438245688.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current firmware-imx version no longer contains ath6k and ar3k firmware.

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/freescale-imx/firmware-imx/Config.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index dd96d8889e64..fca280a85ac9 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -4,10 +4,7 @@ config BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Firmware blobs for the Freescale i.MX SoCs.
 
-	  It contains blobs for Atheros AR6003, SDMA and VPU.
-
-	  Note: it also contains a blob for ar3k/30101 but upstream
-	  linux-firmware has that as well.
+	  It contains blobs for SDMA and VPU.
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
-- 
2.4.6
