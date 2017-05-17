From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 10:46:53 +0200
Subject: [Buildroot] [git commit branch/next] configs: beaglebone: bump
	kernel version to 4.4.41
Message-ID: <20170517084754.F221082929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb1a20049b00d4dfe0c4b06f073824a4d4e1d1f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Switch to Linux kernel version 4.4.41 from the TI SDK 03.03.00.04
(TI SDK release date: 29.03.2017)

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index b74ffbc..611b694 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="adde2ca9f86797071f6e7b2b9e779fa5e4a8f3cd"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f9f6f0db2d5e4f9d2ff46eb31a5a05276a92ed7d"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
