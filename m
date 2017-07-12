From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Jul 2017 17:05:53 +0200
Subject: [Buildroot] [git commit] olimex_a20_olinuxino_micro: bump to Linux
	4.12
Message-ID: <20170712150159.BD70682160@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f307f840d358100b9e885dedb8746b783aecd28e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Build- and run-tested]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/olimex_a20_olinuxino_micro_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_micro_defconfig b/configs/olimex_a20_olinuxino_micro_defconfig
index 0b788f3..a2aff0c 100644
--- a/configs/olimex_a20_olinuxino_micro_defconfig
+++ b/configs/olimex_a20_olinuxino_micro_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.12 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
@@ -18,7 +18,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.12"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-micro"
