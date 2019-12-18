From: Julien Olivain <juju@cotds.org>
Date: Wed, 18 Dec 2019 14:04:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to version
 1.2.1
Message-ID: <20191218130429.847805-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is aligned with i.MX NXP BSP components version
rel_imx_4.14.98_2.0.0_ga

This patch also add the hash file.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 4 ++++
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
new file mode 100644
index 0000000000..013201911b
--- /dev/null
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256 c7b8fe249ba529d85bfe8540e073b73e4fcdf65ee56022c319e53e0065ff1549  imx-sc-firmware-1.2.1.bin
+sha256 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
+sha256 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index fac20d0c6f..cb4e046b8a 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.0
+IMX_SC_FIRMWARE_VERSION = 1.2.1
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 
-- 
2.24.1
