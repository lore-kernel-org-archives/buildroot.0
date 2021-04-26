From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 21:52:20 +0200
Subject: [Buildroot] [git commit]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.3.p1.2
Message-ID: <20210426192521.AE42186387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92843bf352118dbda1e5018ebbc0d31aeaa568f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Same version as NXP release 5.10.9-1.0.0
- No changelog provided by NXP
- Tested on Nitrogen8M device with Weston (DRM backend) as follows:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 0fd8e04f21..ab021b6849 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ee9227d8b3f6da84a4b0be59cdc9a4c67db5c941c719ab44a29e09fe73019cac  kernel-module-imx-gpu-viv-5c8eb7b0576dc2348fb206945ce13e41d0837cf1.tar.gz
+sha256  fbf400adbeaa52af0be234a5dcd96059615db4535cda2bd101d65d468e49e288  kernel-module-imx-gpu-viv-3588f2f6e64082153baae116dd393aa15061473d.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 4a2fb3032b..3afcc9d228 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 5c8eb7b0576dc2348fb206945ce13e41d0837cf1
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 3588f2f6e64082153baae116dd393aa15061473d
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
