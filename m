From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:46 +0100
Subject: [Buildroot] [PATCH 06/14] kernel-module-imx-gpu-viv: bump version
	to 5.0.11 p7.4
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-7-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to match the imx-gpu-viv graphics libraries version.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/dcfa6752

This package has been tested with the following commands:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signen-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 7d01afb..0842c7a 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 955037fd86d31cdddaed15c254f377f4b30a8abcf5a5e4f9185bd660ff14b7c3  kernel-module-imx-gpu-viv-eeeb23c0fb1cee01318088d417025263479c44ac.tar.gz
+sha256	971254d204f6c8f739d0a2094055cd0b8001dc7d366345f996b14a495f92459e  kernel-module-imx-gpu-viv-2b3290d1c1ce383e860a0fd6b53074848a848e65.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 95b0a6b..aad8e40 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = eeeb23c0fb1cee01318088d417025263479c44ac
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 2b3290d1c1ce383e860a0fd6b53074848a848e65
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPLv2
-- 
2.7.0
