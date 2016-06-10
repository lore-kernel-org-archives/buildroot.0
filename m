From: Andrew Webster <awebster@arcx.com>
Date: Fri, 10 Jun 2016 14:09:07 -0400
Subject: [Buildroot] [PATCH v2 03/14] kernel-module-imx-gpu-viv: bump
	version to that of the 5.0.11.p8.4 release
In-Reply-To: <cover.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
Message-ID: <0488cfbbe0603e8dbae57f3115420c174fd6e38b.1465578220.git.awebster@arcx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/c9c30c5

This package has been tested with the following commands with the
matching imx-gpu-viv library:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Andrew Webster <awebster@arcx.com>
---
Changes v1 -> v2:
  - added to patch set

 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 0842c7a..6d810ea 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	971254d204f6c8f739d0a2094055cd0b8001dc7d366345f996b14a495f92459e  kernel-module-imx-gpu-viv-2b3290d1c1ce383e860a0fd6b53074848a848e65.tar.gz
+sha256	6618b36baefd591e94a41167fa50d325c3df473918bceef027ca5a067aa1cffd  kernel-module-imx-gpu-viv-aa83874b916cf5655cb90498b1ea5691537fdbc8.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index aad8e40..11c6768 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 2b3290d1c1ce383e860a0fd6b53074848a848e65
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = aa83874b916cf5655cb90498b1ea5691537fdbc8
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPLv2
-- 
1.9.1
