From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 15 Jun 2020 15:06:33 +0200
Subject: [Buildroot] [PATCH 3/3] package/freescale-imx/firmware-imx: bump
 version to 8.6
In-Reply-To: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
Message-ID: <20200615130633.19909-3-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needed to be updated to be aligned with NXP
BSP 5.4.3_1.0.0.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index e49ce085bf..54a3dafcc0 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  45b0a7392e7a4b2e6c7e1cb988dd660ff3f8cd465afdf796ff840a00db08389d  firmware-imx-8.5.bin
-sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
-sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  a7f4a22c05a990aad43a616e312847ab9d85ce00691b34fa8590d5c7c1d722e9  firmware-imx-8.6.bin
+sha256  1360edf65a32b66d28bcf2d53a1a1c2dc88d4e254c15da3d8e37bf1b6f1f19a1  EULA
+sha256  30ba26ae82fba4033513b67c2c3a00b00e78908d278568a7d648d3430875123a  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 49fda89f28..f27afc5a3b 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.5
+FIRMWARE_IMX_VERSION = 8.6
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.26.2
