From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:14:44 +0200
Subject: [Buildroot] [git commit] configs/snps_archs38_zebu_defconfig:
	update linux version
Message-ID: <20170412191502.292B38222C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fd8f328fc23f73cfbace9814c0b69eb26937cd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With this commit we update snps_archs38_zebu_defconfig the following:

  - bump linux kernel version to 4.10.9
  - set up host linux headers to 4.10

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/snps_archs38_zebu_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/snps_archs38_zebu_defconfig b/configs/snps_archs38_zebu_defconfig
index 96d941a..98beb2b 100644
--- a/configs/snps_archs38_zebu_defconfig
+++ b/configs/snps_archs38_zebu_defconfig
@@ -7,12 +7,12 @@ BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
 BR2_LINUX_KERNEL_DEFCONFIG="zebu_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
