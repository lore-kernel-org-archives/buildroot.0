From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  5 Apr 2018 10:22:48 +0200
Subject: [Buildroot] [PATCH 1/2] configs/bananapro: bump Linux to version
 4.14.32
Message-ID: <20180405082249.22327-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 configs/bananapro_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index 5a71d757e4..c6473be3ae 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lemaker/bananapro/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.32"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/lemaker/bananapro/linux-wifi.fragment"
-- 
2.16.3
