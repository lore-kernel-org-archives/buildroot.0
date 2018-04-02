From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon,  2 Apr 2018 15:01:18 -0500
Subject: [Buildroot] [PATCH] configs/qemu_ppc64_e5500_defconfig: needs
 host-openssl for the Linux kernel build
Message-ID: <1522699278-41848-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 configs/qemu_ppc64_e5500_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index e4a7518..8173a02 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
1.9.1
