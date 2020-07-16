From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 16:48:35 +0200
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.0.p2.4
In-Reply-To: <20200716144837.701680-1-gary.bisson@boundarydevices.com>
References: <20200716144837.701680-1-gary.bisson@boundarydevices.com>
Message-ID: <20200716144837.701680-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Same version as NXP release 5.4.24-2.1.0
- No changelog provided by NXP
- COPYING/EULA update: LA_OPT_NXP_Software_License v11 February 2020

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 98ca7fbe7e..4ff5926482 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	6d6d02d035d988cbdb2014794f2efe970a3f5ac277202882bbf553bb7fd789d2  imx-gpu-g2d-6.4.0.p1.0-arm.bin
-sha256	35885f435dbe951d2c0f439a376ed8a59a50b67a1b7e1e14fa2ab03995abb1ad  imx-gpu-g2d-6.4.0.p1.0-aarch64.bin
-sha256	d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-sha256	9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256	010bab5780476f26406e16b058514453dc235a0e7f4b995fa03c976d06e5cb96  imx-gpu-g2d-6.4.0.p2.4-arm.bin
+sha256	553bbe9ee1caa222fd14b835deb2afedf9ed936b7a13424328df75892286f666  imx-gpu-g2d-6.4.0.p2.4-aarch64.bin
+sha256	2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
+sha256	7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 7700170970..15cfe66f0b 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.0.p1.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.0.p2.4-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.0.p1.0-arm
+IMX_GPU_G2D_VERSION = 6.4.0.p2.4-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
-- 
2.27.0
