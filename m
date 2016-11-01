From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  1 Nov 2016 17:10:02 +0100
Subject: [Buildroot] [PATCH 5/8] kernel-module-imx-gpu-viv: bump version to
	5.0.11.p8.6
In-Reply-To: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
References: <20161101161005.13302-1-gary.bisson@boundarydevices.com>
Message-ID: <20161101161005.13302-6-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/51148d70

This package has been tested with the following commands:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 6d810ea..9c43ea3 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	6618b36baefd591e94a41167fa50d325c3df473918bceef027ca5a067aa1cffd  kernel-module-imx-gpu-viv-aa83874b916cf5655cb90498b1ea5691537fdbc8.tar.gz
+sha256	51dd137bd67ae991fa58fff4151c6bd7dd46bafd613f43e83d8403ec37217a90  kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 11c6768..bcbd8d2 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = aa83874b916cf5655cb90498b1ea5691537fdbc8
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = bfa78b095a892705a09afe9514fc5d236b3124d2
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPLv2
-- 
2.9.3
