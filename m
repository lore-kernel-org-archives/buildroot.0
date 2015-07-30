From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:08:01 +0200
Subject: [Buildroot] [git commit] firmware-imx: update package description
Message-ID: <20150730210806.5CA6B81D81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75369a86106c1beae70f78519b8f9436f1a7e821
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current firmware-imx version no longer contains ath6k and ar3k firmware.

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/firmware-imx/Config.in |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index dd96d88..fca280a 100644
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
