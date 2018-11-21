From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Nov 2018 21:08:31 +0100
Subject: [Buildroot] [git commit branch/next]
 configs/olimex_a20_olinuxino_lime*: add some sunxi packages
Message-ID: <20181121200537.59F8184001@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e71b396a171594d5b913d8b8c11079d376198ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- sunxi mali mainline
- sunxi tools

like in olimex_a20_olinuxino_lime_legacy.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 5 +++++
 configs/olimex_a20_olinuxino_lime_defconfig  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index d846f4fedd..7851314a25 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -25,6 +25,11 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
+# sunxi packages
+BR2_PACKAGE_SUNXI_TOOLS=y
+BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index e60bf0882d..be09c5d46a 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -25,6 +25,11 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
+# sunxi packages
+BR2_PACKAGE_SUNXI_TOOLS=y
+BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
