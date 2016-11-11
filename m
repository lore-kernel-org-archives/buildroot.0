From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 15:17:26 +0100
Subject: [Buildroot] [git commit branch/next] config: bump linux kernel to
	4.8.6 in synopsys defconfigs
Message-ID: <20161111141821.4678D816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e71f94a4d1056a6eb29da9b52a3cc25755d573a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With this commit we update ARC defconfigs with the following:

  - "snps_axs101_defconfig", "snps_axs103_defconfig" and
    "snps_hs38_smp_vdk_defconfig":
     - bump linux kernel version to 4.8.6
     - set up host linux headers to 4.8

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/snps_axs101_defconfig       | 6 +++---
 configs/snps_axs103_defconfig       | 6 +++---
 configs/snps_hs38_smp_vdk_defconfig | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index f272853..eea7a50 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 
 # Bootloader
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index 75596c9..08c55de 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 
 # Bootloader
diff --git a/configs/snps_hs38_smp_vdk_defconfig b/configs/snps_hs38_smp_vdk_defconfig
index 32922f8..d4dcd1b 100644
--- a/configs/snps_hs38_smp_vdk_defconfig
+++ b/configs/snps_hs38_smp_vdk_defconfig
@@ -8,12 +8,12 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.7 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
+# Linux headers same as kernel, a 4.8 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
