From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 22:24:59 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/imx-gpu-viv: bump to
 version 6.4.0.p2.4
Message-ID: <20200716203405.6DA6087840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f0f5491147f10327bb4f71d67d027e8d1b03f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Same version as NXP release 5.4.24-2.1.0
- No changelog provided by NXP
- COPYING/EULA update: LA_OPT_NXP_Software_License v11 February 2020
- Tested on Nitrogen8M device with Weston (DRM backend) as follows:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 1a67b53ac5..6de74a9496 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	b5c94b56a9f7c84aa084603a6ca21b5f3941b400e4f6ee8558b58c9b9f1aab36  imx-gpu-viv-6.4.0.p1.0-aarch32.bin
-sha256	45852a5c3c61a9215a2ffb7387a6e1cce7ddac6f12513fc77459ad7e1f1b3a27  imx-gpu-viv-6.4.0.p1.0-aarch64.bin
-sha256	d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-sha256	9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256	9cc4c6594083f5970bc394a698a0a8ed0c7f2a1a753dfbf25cb0be5ab8bdcbd5  imx-gpu-viv-6.4.0.p2.4-aarch32.bin
+sha256	a295f41a6346c507fc8a677c26ecf9b2f416735e32e6d0734516ef5363027720  imx-gpu-viv-6.4.0.p2.4-aarch64.bin
+sha256	2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
+sha256	7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 646d4e3673..b6b070e4f6 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_aarch64),y)
-IMX_GPU_VIV_VERSION = 6.4.0.p1.0-aarch64
+IMX_GPU_VIV_VERSION = 6.4.0.p2.4-aarch64
 else
-IMX_GPU_VIV_VERSION = 6.4.0.p1.0-aarch32
+IMX_GPU_VIV_VERSION = 6.4.0.p2.4-aarch32
 endif
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
