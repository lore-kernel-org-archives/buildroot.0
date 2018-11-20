From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Nov 2018 08:54:25 +0100
Subject: [Buildroot] [git commit] configs/olimex_imx233_olinuxino: bump
 kernel version
Message-ID: <20181202071556.B3FA88843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d6a57bcf4ca03d240b96f7abd307a00359a3dde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_imx233_olinuxino_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 89ab5952cb..232d9d0dce 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -14,7 +14,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.2"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
