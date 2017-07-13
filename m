From: Martin Bark <martin@barkynet.com>
Date: Thu, 13 Jul 2017 13:22:32 +0100
Subject: [Buildroot] [PATCH 7/7] configs/raspberrypi3_64_defconfig: bump
	kernel version to 4.9.36
In-Reply-To: <1499948552-11324-1-git-send-email-martin@barkynet.com>
References: <1499948552-11324-1-git-send-email-martin@barkynet.com>
Message-ID: <1499948552-11324-7-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 configs/raspberrypi3_64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 23db9cc..71f06fd 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5e4ee836560d4c0371e109bf469e1ad808ae7a44"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9126e25b0934bd7bd843763310ea4b34c6e139d0"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
-- 
2.7.4
