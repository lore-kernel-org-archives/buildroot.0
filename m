From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:28:10 +0200
Subject: [Buildroot] [git commit] imx-gpu-g2d: bump to version 6.2.4.p1.2
Message-ID: <20180617132558.6DE398833A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c72165998bba0982e4f41f97a508b08b0723cbe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Same as imx-gpu-viv, no changelog was provided by NXP.

Tested with the following commands:
 # /usr/share/examples/g2d_samples/g2d_multiblit_test
 # /usr/share/examples/g2d_samples/g2d_overlay_test
 # /usr/share/examples/g2d_samples/g2d_test
 # gst-launch-1.0 videotestsrc ! imxg2dvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash | 2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
index 299ec703f5..3bcbc558e2 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -1 +1 @@
-sha256	070a95aa9942bd67e8ba4012962df74143bffb9998301ac097dab5e1437000d8  imx-gpu-g2d-6.2.2.p0.bin
+sha256	5f2d2171d5cd57f37ab07184fc908a0f6ecb2a97f023f04c2f9f3b3d7fec8481  imx-gpu-g2d-6.2.4.p1.2.bin
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
index aafd70dc9d..015ab628b6 100644
--- a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_G2D_VERSION = 6.2.2.p0
+IMX_GPU_G2D_VERSION = 6.2.4.p1.2
 IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
 IMX_GPU_G2D_DEPENDENCIES = imx-gpu-viv
