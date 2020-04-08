From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 21:41:32 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu: bump
 version to 5.4.39.1
Message-ID: <20200408192935.904768E079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9aaf2125f34c8736817c8b97fb897223fb3bd13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match NXP BSP 4.19.35_1.1.0 release:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-vpu?h=warrior-4.19.35-1.1.0

The license files have changed significantly, but it remains an NXP
Semiconductor Software License Agreement.

Reviewed-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Reviewed-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Laurent Gauthier <laurent.gauthier_1@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 6 +++---
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 5fa93d8055..81ea35a7fb 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  34bed0ddf6c797f444bddfa5d5495adc751ff268b6431d8beb48129c89c9e47f  imx-vpu-5.4.38.bin
-sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
-sha256  fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
+sha256  b7bb67b00daf436fd91a2760c2db375a962e2c919045ce8bf81bd54b95d999c5  imx-vpu-5.4.39.1.bin
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index e30237508e..e61b9f829a 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.38
+IMX_VPU_VERSION = 5.4.39.1
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
