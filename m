From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:00:40 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] configs/orangepi_pc_plus:
 needs host-openssl for the Linux kernel build
Message-ID: <20180330193201.BA08583D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c911751d5bf8fc1deaa8803ff0e0e30e3f3c2e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306885

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 661c81b2fe8e349b83c05c60b1489eacbd47f212)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_pc_plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 053c3bffbd..edc3909ae7 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -13,6 +13,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc-plus/linux-extras.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
