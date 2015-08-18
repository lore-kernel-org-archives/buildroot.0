From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:38:54 +0200
Subject: [Buildroot] [git commit branch/next] configs/raspberrypi: bump
	kernel version to 4.1.5
Message-ID: <20150818123919.ED0C27F971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=556d292754932e6f4d5364c86098122980c78521
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_defconfig |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 61487a4..af702a3 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -3,19 +3,18 @@ BR2_arm1176jzf_s=y
 
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
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f90f981770e3ac8506dc84c9cd01471faaa0b0c2"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="592503752b6951972f161f04280683c5af38d173"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
