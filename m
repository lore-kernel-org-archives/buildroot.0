From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 17:07:04 -0300
Subject: [Buildroot] [PATCH 1/3] configs/raspberypi: bump to kernel version
	4.1.15
Message-ID: <1452197226-15625-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/raspberrypi2_defconfig | 4 ++--
 configs/raspberrypi_defconfig  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 0d0c6d0..8e9aa66 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 # Lock to 4.1 headers as the RPi kernel stable tree is
 # based off the 4.1 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.5"
+BR2_DEFAULT_KERNEL_VERSION="4.1.15"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="592503752b6951972f161f04280683c5af38d173"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 76edc6b..98e6ae3 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 # Lock to 4.1 headers as the RPi kernel stable tree is
 # based off the 4.1 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="4.1.5"
+BR2_DEFAULT_KERNEL_VERSION="4.1.15"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
@@ -15,7 +15,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="592503752b6951972f161f04280683c5af38d173"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="d33d0293e245badc4ca6ede3984d8bb8ea63cb1a"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_ZIMAGE=y
 
-- 
2.4.10
