From: Julien Olivain <juju@cotds.org>
Date: Mon,  2 Dec 2019 21:06:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx: bump
 version to 8.1.1
Message-ID: <20191202200601.418280-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is aligned with i.MX NXP BSP components version
rel_imx_4.14.98_2.0.0_ga

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index c22ee4c192..6d99ec0077 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 a8f099bdf786b2da1e8b43094950c033ccdbf93f1b8a93caffb912e1500cd735  firmware-imx-7.5.bin
+sha256 c115d5d0d115fc14754671bd2428f672f9f99677988588accef2fbca2c3f749c  firmware-imx-8.1.1.bin
 sha256 fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
 sha256 78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index b70b581523..59af3f9b96 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 7.5
+FIRMWARE_IMX_VERSION = 8.1.1
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
-- 
2.23.0
