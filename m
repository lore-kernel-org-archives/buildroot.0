From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Jul 2018 11:26:24 +0200
Subject: [Buildroot] [PATCH v2 1/8] firmware-imx: bump to version 7.5
In-Reply-To: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
References: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
Message-ID: <20180726092631.4888-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package includes new binaries for i.MX8QXP.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index dd0e13a7cf..c4930bb67d 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 8a8ec439d014e928f42c49bab1c382914ec5b4f1041df28e5d687eb194bd07ab  firmware-imx-7.4.bin
+sha256 a8f099bdf786b2da1e8b43094950c033ccdbf93f1b8a93caffb912e1500cd735  firmware-imx-7.5.bin
 sha256 faf01d10e484879247963eb97d96622a980232e22a35e487dfe53b13708b686a  EULA
 sha256 0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index b9756fc2bf..0a503d7a66 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 7.4
+FIRMWARE_IMX_VERSION = 7.5
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.18.0
