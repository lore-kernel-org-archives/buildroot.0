From: Martin Bark <martin@barkynet.com>
Date: Sun,  5 Mar 2017 16:06:11 +0000
Subject: [Buildroot] [PATCH 3/8] configs/raspberrypi2_defconfig: bump kernel
	version to 4.9.13
In-Reply-To: <1488729976-7116-1-git-send-email-martin@barkynet.com>
References: <1488729976-7116-1-git-send-email-martin@barkynet.com>
Message-ID: <1488729976-7116-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 configs/raspberrypi2_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 1ec92e7..55765b3 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,13 +7,13 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1ebe8d4a4c96cd6a90805c74233a468854960f67"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="935c7ce84c982a26f567a03a58a1537424569938"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
-- 
2.7.4
