From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:44:16 +0200
Subject: [Buildroot] [git commit] olimex_a20_olinuxino_lime: bump kernel to
	4.1.3
Message-ID: <20150723204425.8EC3B81E8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fe68d2aff1748b988671ba778868a8b1360c7a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/olimex_a20_olinuxino_lime_defconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index b19b92f..fa2e98e 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -3,10 +3,10 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 
-# Lock to 4.0 headers to avoid breaking with newer kernels
+# Lock to 4.1 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.0.5"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
+BR2_DEFAULT_KERNEL_VERSION="4.1.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
@@ -19,7 +19,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino/boot.cmd $(TARGET_DIR)/b
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.3"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_ZIMAGE=y
