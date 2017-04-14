From: Martin Bark <martin@barkynet.com>
Date: Fri, 14 Apr 2017 16:32:28 +0100
Subject: [Buildroot] [PATCH 5/6] configs/raspberrypi2_defconfig: bump
	version to 4.9.21
In-Reply-To: <1492183949-8181-1-git-send-email-martin@barkynet.com>
References: <1492183949-8181-1-git-send-email-martin@barkynet.com>
Message-ID: <1492183949-8181-5-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 configs/raspberrypi2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 55765b3..48d632e 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5e4ee836560d4c0371e109bf469e1ad808ae7a44"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
-- 
2.7.4
