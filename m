From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:30:27 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.3.p0.0
Message-ID: <20201226171348.1561D88DA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68b076a56dc7c2f05bf881cdbf4b0af02871361d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 4ff5926482..bab4bfe9c0 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	010bab5780476f26406e16b058514453dc235a0e7f4b995fa03c976d06e5cb96  imx-gpu-g2d-6.4.0.p2.4-arm.bin
-sha256	553bbe9ee1caa222fd14b835deb2afedf9ed936b7a13424328df75892286f666  imx-gpu-g2d-6.4.0.p2.4-aarch64.bin
-sha256	2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
-sha256	7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
+sha256	725ad2edd41661713540d5e32509c754cda452acc608955689b8a64977b26ced  imx-gpu-g2d-6.4.3.p0.0-arm.bin
+sha256	97ee90c81fa0db88e3249cb7df77f17f816ceb9a40355e03f72df99e600d7331  imx-gpu-g2d-6.4.3.p0.0-aarch64.bin
+sha256	69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
+sha256	a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 15cfe66f0b..8bf7bedcc4 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.0.p2.4-aarch64
+IMX_GPU_G2D_VERSION = 6.4.3.p0.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.0.p2.4-arm
+IMX_GPU_G2D_VERSION = 6.4.3.p0.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
