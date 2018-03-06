From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:26:37 +0100
Subject: [Buildroot] [git commit] configs/orangepi_zero: needs host-openssl
 for the Linux kernel build
Message-ID: <20180306143235.886D482534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a645de1362a16e89430b39f6a31049a3fdbc9f57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306889

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_zero_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 2efccc0ced..fcf9b325cd 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero/linux-extras.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
