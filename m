From: Martin Bark <martin@barkynet.com>
Date: Thu, 13 Jul 2017 13:22:29 +0100
Subject: [Buildroot] [PATCH 4/7] configs/raspberrypi0_defconfig: bump kernel
	version to 4.9.36
In-Reply-To: <1499948552-11324-1-git-send-email-martin@barkynet.com>
References: <1499948552-11324-1-git-send-email-martin@barkynet.com>
Message-ID: <1499948552-11324-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 configs/raspberrypi0_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 10947b8..c193d89 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -10,7 +10,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5e4ee836560d4c0371e109bf469e1ad808ae7a44"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9126e25b0934bd7bd843763310ea4b34c6e139d0"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
-- 
2.7.4
