From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 24 Dec 2020 07:59:42 +0100
Subject: [Buildroot] [PATCH 04/15] package/freescale-imx/imx-sc-firmware:
 bump version to 1.6.0
In-Reply-To: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1608793193-11843-5-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index bd8de5b..630ccc8 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  5a28180217975f3d78fcfac15e46b0a942910fadf078e4af76deb6dc498136ed  imx-sc-firmware-1.2.7.1.bin
-sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
-sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  d3b04a49bcfdb5c7aa7e8f5ff89c040e9dfde0e8cb4b22bfb31f9cbb22a9d310  imx-sc-firmware-1.6.0.bin
+sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
+sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 954cfc4..dab6130 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.2.7.1
+IMX_SC_FIRMWARE_VERSION = 1.6.0
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
-- 
2.7.4
