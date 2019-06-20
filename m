From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jun 2019 13:29:05 +0200
Subject: [Buildroot] [git commit] configs/mx51evk: Bump kernel version
Message-ID: <20190620113224.1C49682133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87372e6a47eb63dc45d15d4d0df478f6cec66680
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the kernel version to 5.1.10.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/mx51evk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index 3c2d56132d..0cb8f476cd 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+# Linux headers same as kernel, a 5.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.10"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-babbage"
