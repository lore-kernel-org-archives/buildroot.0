From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Sep 2017 22:34:29 +0200
Subject: [Buildroot] [PATCH] configs: nexbox_a95x_defconfig: bump to kernel
	4.13.4
Message-ID: <20170929203429.17341-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nexbox_a95x_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 40805662ff..5fc009940f 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.4"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-s905x-nexbox-a95x"
-- 
2.11.0
