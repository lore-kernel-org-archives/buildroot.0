From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat,  8 Dec 2018 18:42:06 +0100
Subject: [Buildroot] [PATCH] configs: nexbox_a95x_defconfig: bump to kernel
 4.19.8
Message-ID: <20181208174207.18512-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nexbox_a95x_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 5fc009940f..4b0fc9cfba 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.8"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
-- 
2.11.0
