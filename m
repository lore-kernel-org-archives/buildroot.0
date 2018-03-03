From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Sat,  3 Mar 2018 07:27:04 +0000
Subject: [Buildroot] [PATCH] Fix "Incorrect selection of kernel headers:
 expected 4.11.x, got 4.15.x" for qemu_x86_64_defconfig
Message-ID: <20180303072704.11166-1-ciro.santilli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 configs/qemu_x86_64_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 92a196790d..b92ae17ae6 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,8 +9,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
-- 
2.16.1
