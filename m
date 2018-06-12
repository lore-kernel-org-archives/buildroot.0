From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 12 Jun 2018 17:02:21 +0200
Subject: [Buildroot] [PATCH 4/4] kernel-module-imx-gpu-viv: bump to version
 6.2.4.p1.2
In-Reply-To: <20180612150221.31792-1-gary.bisson@boundarydevices.com>
References: <20180612150221.31792-1-gary.bisson@boundarydevices.com>
Message-ID: <20180612150221.31792-5-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package has been tested with the following commands:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index c6204aff0e..3ed7ca2dd9 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	35db597ae0dd8e9e80511e5e9d882a01e4c178b83ffc192c8dd6a1a35859aa13  kernel-module-imx-gpu-viv-3b9e057f29853fd29364aa666328a92b807007d7.tar.gz
+sha256	ad910b7d36dc433bbbe85808d278312e9199635aaa5d00097b70ffab11bde9e6  kernel-module-imx-gpu-viv-86354002bea77acd9ce1812712e9d8485b377ec8.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 2e6744c4f9..c76a5ee386 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 3b9e057f29853fd29364aa666328a92b807007d7
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 86354002bea77acd9ce1812712e9d8485b377ec8
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.17.1
