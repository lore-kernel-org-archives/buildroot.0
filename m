From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Nov 2013 07:14:25 -0300
Subject: [Buildroot] [PATCH 3/3] qemu/arm-nuri: bump to latest 3.10.x kernel
	version
In-Reply-To: <1384424065-22595-1-git-send-email-gustavo@zacarias.com.ar>
References: <1384424065-22595-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1384424065-22595-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_arm_nuri_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 965f55d..af3e79a 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.10 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.18"
+BR2_DEFAULT_KERNEL_VERSION="3.10.19"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.19"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.3.2
