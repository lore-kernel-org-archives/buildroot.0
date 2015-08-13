From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 13 Aug 2015 18:22:50 +0200
Subject: [Buildroot] [PATCH 4/5] configs/raspberrypi2: bump kernel version
	to 4.1.5
In-Reply-To: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
References: <1439482971-92878-1-git-send-email-benoit@wsystem.com>
Message-ID: <1439482971-92878-5-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 configs/raspberrypi2_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 02603a2..7e49f0c 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,16 +7,16 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Lock to 4.0 headers as the RPi kernel stable tree is
-# based off the 4.0 branch
+# Lock to 4.1 headers as the RPi kernel stable tree is
+# based off the 4.1 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.0.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
+BR2_DEFAULT_KERNEL_VERSION="4.1.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f90f981770e3ac8506dc84c9cd01471faaa0b0c2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="592503752b6951972f161f04280683c5af38d173"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
-- 
2.1.4
