From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 16 Jul 2020 16:48:37 +0200
Subject: [Buildroot] [PATCH 3/3]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version 6.4.0.p2.4
In-Reply-To: <20200716144837.701680-1-gary.bisson@boundarydevices.com>
References: <20200716144837.701680-1-gary.bisson@boundarydevices.com>
Message-ID: <20200716144837.701680-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Same version as NXP release 5.4.24-2.1.0
- No changelog provided by NXP
- Tested on Nitrogen8M device with Weston (DRM backend) as follows:
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index fe40692a6b..b9b93aeb5b 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  d747c39f900315f2f46b8397f55d199c7ece7328ae91ce21a2f5eb0895603865  kernel-module-imx-gpu-viv-4cc1368dc05073b368cfdbadfdf5de3a3d3b15f4.tar.gz
+sha256  52b7425453fa32300e4779220d5deebd4a43a7525991ce3e5ce27eba909780f3  kernel-module-imx-gpu-viv-f2e8483fbda59bf2482f77efb0804c014848f749.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index a037858cfc..89b47f9147 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 4cc1368dc05073b368cfdbadfdf5de3a3d3b15f4
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = f2e8483fbda59bf2482f77efb0804c014848f749
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.27.0
