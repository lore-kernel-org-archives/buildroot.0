From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Nov 2017 20:15:36 +0100
Subject: [Buildroot] [git commit] orange-pi-pc: bump kernel version to
 4.13.11
Message-ID: <20171105192818.134EA81012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8803ac095a32576a76411b38220f14e1409cd10c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_pc_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 9c6ce1b..02bcfa2 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/orangepi/orangepi-pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/orangepi/orangepi-pc/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.11"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
