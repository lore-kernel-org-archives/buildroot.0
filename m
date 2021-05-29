From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Sat, 29 May 2021 13:19:09 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu_s390x_defconfig: bump kernel
 version to 5.10.41
Message-ID: <20210529111909.628275-1-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 configs/qemu_s390x_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index 4aed9d9ae5..ba8f3b2908 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -17,7 +17,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.41"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/s390x/patches"
-- 
2.31.1
