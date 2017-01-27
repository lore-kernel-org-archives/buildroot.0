From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jan 2017 13:45:09 +0100
Subject: [Buildroot] [git commit] config: bump linux kernel to 4.9.6 in
	synopsys defconfigs
Message-ID: <20170127124657.A272F820E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84629596474896990820af0ac992bccec749d2ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit we update ARC defconfigs with the following:

  - "snps_axs101_defconfig" and "snps_axs103_defconfig":
     - bump linux kernel version to 4.9.6
     - set up host linux headers to 4.9

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/snps_axs101_defconfig | 6 +++---
 configs/snps_axs103_defconfig | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
index 07564b4..48372ac 100644
--- a/configs/snps_axs101_defconfig
+++ b/configs/snps_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 
 # Bootloader
diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
index d2a838e..eb16b70 100644
--- a/configs/snps_axs103_defconfig
+++ b/configs/snps_axs103_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 
 # Bootloader
