From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 24 Dec 2020 07:59:44 +0100
Subject: [Buildroot] [PATCH 06/15] package/freescale-imx/imx-vpu: bump
 version to 5.4.39.3
In-Reply-To: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1608793193-11843-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1608793193-11843-7-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/imx-vpu/imx-vpu.hash | 6 +++---
 package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
index 81ea35a..6ab6751 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.hash
+++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  b7bb67b00daf436fd91a2760c2db375a962e2c919045ce8bf81bd54b95d999c5  imx-vpu-5.4.39.1.bin
-sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  87cb799a57df654db29403cb74a75ca5185a1517022d3a4a16b8d69056c36127  imx-vpu-5.4.39.3.bin
+sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
+sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index e61b9f8..14a1a7a 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_VERSION = 5.4.39.1
+IMX_VPU_VERSION = 5.4.39.3
 IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
-- 
2.7.4
