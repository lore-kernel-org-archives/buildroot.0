From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:49:47 +0200
Subject: [Buildroot] [git commit] configs/imx7dpico: bump kernel to 5.3.4
Message-ID: <20191008204454.1571B81535@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=502d52e5de4a60634d86f4b10e6a2fb778f16ade
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx7dpico_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/imx7dpico_defconfig b/configs/imx7dpico_defconfig
index 64961628a0..190e77fbfe 100644
--- a/configs/imx7dpico_defconfig
+++ b/configs/imx7dpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.2 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+# Linux headers same as kernel, a 5.3 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc4"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-pico-pi"
