From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 15:17:25 +0200
Subject: [Buildroot] [git commit] imx-gpu-viv: bump to version 6.2.4.p1.2
Message-ID: <20180617132558.582268833A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90955660da1508b0ebd93c49a2896b4c32351d0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No changelog was provided by NXP but we can assume it's the latest and
therefore the greatest.

What is known, is that that same version worked both ARM and ARM64.
The support for the latter will be added in a follow-up patch.

This package has been tested with X11, Framebuffer and Wayland
back-ends:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7
 # gmem_info
 ... display memory use per PID ...

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash | 2 +-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
index 894bc90dae..3b54eec099 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash
@@ -1 +1 @@
-sha256	4f93a4412c93ca5959aa2437bfed2ecbaf983b5b272be5977f76a967de5db150  imx-gpu-viv-6.2.2.p0-aarch32.bin
+sha256	dddadd164bede4793409ccfb636324dd73862c33458db66a5860f126bada25dc  imx-gpu-viv-6.2.4.p1.2-aarch32.bin
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index a339c22978..35ff9d457c 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_GPU_VIV_VERSION = 6.2.2.p0-aarch32
+IMX_GPU_VIV_VERSION = 6.2.4.p1.2-aarch32
 IMX_GPU_VIV_SITE = $(FREESCALE_IMX_SITE)
 IMX_GPU_VIV_SOURCE = imx-gpu-viv-$(IMX_GPU_VIV_VERSION).bin
 
