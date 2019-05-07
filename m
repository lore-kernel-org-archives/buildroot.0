From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Tue,  7 May 2019 21:44:59 +0200
Subject: [Buildroot] [PATCH 2/2] configs/bananapro: bump Linux to 4.14.116
Message-ID: <20190507194459.32138-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/bananapro_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 7377670934..a6433ee597 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.91"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.116"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
-- 
2.21.0
