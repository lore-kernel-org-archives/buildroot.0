From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 10 May 2018 18:22:35 +0200
Subject: [Buildroot] [PATCH] firmware-imx: bump to version 7.4
Message-ID: <20180510162235.18144-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This update includes GA version of the DDR training binaries for i.MX8M.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index ca8556fa21..dd0e13a7cf 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 3e107d83ed2367c9565250d6ff3903cc604bf4d9aa505391260ead0f51ceb8d9  firmware-imx-7.2.bin
+sha256 8a8ec439d014e928f42c49bab1c382914ec5b4f1041df28e5d687eb194bd07ab  firmware-imx-7.4.bin
 sha256 faf01d10e484879247963eb97d96622a980232e22a35e487dfe53b13708b686a  EULA
 sha256 0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 351496a7a7..b9756fc2bf 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 7.2
+FIRMWARE_IMX_VERSION = 7.4
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.17.0
