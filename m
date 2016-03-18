From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 23:16:04 +0100
Subject: [Buildroot] [git commit] kernel-module-imx-gpu-viv: bump version to
	5.0.11 p7.4
Message-ID: <20160318223205.47F5781D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ce8873e0dd39a610e0139a2ffac12b2bf1825d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to match the imx-gpu-viv graphics libraries version.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/dcfa6752

This package has been tested with the following commands:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signen-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
