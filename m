From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:30:27 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump
 version to 6.4.3.p0.0
Message-ID: <20201226171348.23DA081540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afbeed5d177cdaa7aa814ed533ecfb08cce01da9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 6de74a9496..8978a3a769 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	9cc4c6594083f5970bc394a698a0a8ed0c7f2a1a753dfbf25cb0be5ab8bdcbd5  imx-gpu-viv-6.4.0.p2.4-aarch32.bin
-sha256	a295f41a6346c507fc8a677c26ecf9b2f416735e32e6d0734516ef5363027720  imx-gpu-viv-6.4.0.p2.4-aarch64.bin
-sha256	2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
-sha256	7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
+sha256	cdec43e45e840fe30e188e3b6f07c44b4a1ceafc315e605c8d278564db5fcbe9  imx-gpu-viv-6.4.3.p0.0-aarch32.bin
+sha256	b3bd03288106daf3a62d2301d09569292ef6a5c74c761cfa4e41dad85e4bf547  imx-gpu-viv-6.4.3.p0.0-aarch64.bin
+sha256	69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
+sha256	a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index fca8a4d447..0bb923a2f4 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.0.p2.4-aarch64
+IMX_GPU_VIV_VERSION = 6.4.3.p0.0-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.0.p2.4-aarch32
+IMX_GPU_VIV_VERSION = 6.4.3.p0.0-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
