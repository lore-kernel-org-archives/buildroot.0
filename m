From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:24:28 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-g2d: bump to
 version 6.4.3.p1.0
Message-ID: <20201229220714.04DBF7F9E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=130f3426b63765c4b8457db77f65ab3c26c86617
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Same version as NXP release 5.4.70-2.3.0
- EULA/COPYING: update to LA_OPT_NXP_Software_License v17
- No changelog provided by NXP

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index bab4bfe9c0..8bfd302b16 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	725ad2edd41661713540d5e32509c754cda452acc608955689b8a64977b26ced  imx-gpu-g2d-6.4.3.p0.0-arm.bin
-sha256	97ee90c81fa0db88e3249cb7df77f17f816ceb9a40355e03f72df99e600d7331  imx-gpu-g2d-6.4.3.p0.0-aarch64.bin
-sha256	69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
-sha256	a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
+sha256	8d3b024151d4bdcc4f68cdbba9c4e5d126d55c9258de5821c43b393ae3f840b4  imx-gpu-g2d-6.4.3.p1.0-arm.bin
+sha256	47a39b171d83bced378b1b4f408be6304850fe2f25bf4577dd1ea78e22473f3d  imx-gpu-g2d-6.4.3.p1.0-aarch64.bin
+sha256	9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256	72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index 8bf7bedcc4..3e6c3fc1c5 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_G2D_VERSION = 6.4.3.p0.0-aarch64
+IMX_GPU_G2D_VERSION = 6.4.3.p1.0-aarch64
 else
-IMX_GPU_G2D_VERSION = 6.4.3.p0.0-arm
+IMX_GPU_G2D_VERSION = 6.4.3.p1.0-arm
 endif
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
