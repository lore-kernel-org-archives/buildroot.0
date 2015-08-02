From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  2 Aug 2015 16:56:31 +0200
Subject: [Buildroot] [PATCH] configs/raspberry2_defconfig: Fix typo
Message-ID: <1438527391-31932-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 configs/raspberrypi2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 7b12040..02603a2 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f90f981770e3ac8506dc84c9cd01471faaa0b0c2"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-BR2_LINUX_KERNEL_ZIMAGE=yo
+BR2_LINUX_KERNEL_ZIMAGE=y
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.4.6
