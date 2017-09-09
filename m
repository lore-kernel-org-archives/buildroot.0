From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:09:16 +0200
Subject: [Buildroot] [git commit] configs: nexbox_a95x_defconfig: bump to
	kernel 4.13
Message-ID: <20170909200206.C377980F66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c857673111b6504e3ad1e41b6e7c6b3c9e83920d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nexbox_a95x_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 8026593..4080566 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
