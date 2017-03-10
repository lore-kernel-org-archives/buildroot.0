From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Mar 2017 23:02:10 +0100
Subject: [Buildroot] [PATCH] configs/nanopineo: update kernel to 4.10
Message-ID: <1489183330-30280-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configs/nanopi_neo_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index 958c976..fbc0902 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -7,13 +7,13 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nanopi-neo/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nanopi-neo/post-image.sh"
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 
 # Use a -rc kernel to get the DTS
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-nanopi-neo"
-- 
2.7.4
