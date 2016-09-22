From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Sep 2016 23:47:08 +0200
Subject: [Buildroot] [PATCH v1] raspberrypi_defconfig: bump to kernel
	version 4.4.21
In-Reply-To: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
References: <1474580832-22406-1-git-send-email-ps.report@gmx.net>
Message-ID: <1474580832-22406-3-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 configs/raspberrypi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 422426b..fd2a546 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -12,7 +12,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="26f3b72a9c049be10e6af196252283e1f6ab9d1f"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9669a50a3a8e4f33b4fe138277bc4407e1eab9b2 "
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
-- 
2.8.1
