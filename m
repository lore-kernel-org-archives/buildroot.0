From: Maeva Manuel <maeva.manuel@oss.nxp.com>
Date: Fri, 20 Mar 2020 17:31:56 +0100
Subject: [Buildroot] [PATCH 3/5] package/freescale-imx/imx-sc-firmware: bump
 to version 1.2.7.1
In-Reply-To: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200320163158.18341-4-maeva.manuel@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needed to be updated to be aligned with NXP BSP
4.19.35_1.1.0

Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index 013201911b..fb9c5e7f85 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 c7b8fe249ba529d85bfe8540e073b73e4fcdf65ee56022c319e53e0065ff1549  imx-sc-firmware-1.2.1.bin
-sha256 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
-sha256 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
+sha256  5a28180217975f3d78fcfac15e46b0a942910fadf078e4af76deb6dc498136ed  imx-sc-firmware-1.2.7.1.bin
+sha256  69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
+sha256  6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 6a768ea109..954cfc4072 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.2.1
+IMX_SC_FIRMWARE_VERSION = 1.2.7.1
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
-- 
2.17.1
