From: Mario Lang <mlang@blind.guru>
Date: Wed,  6 Dec 2017 09:20:16 +0100
Subject: [Buildroot] [PATCH 1/1] configs/raspberrypi*: bump kernel version
Message-ID: <20171206082016.18262-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now based on 4.9.66 (from 4.9.52).

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 configs/raspberrypi0_defconfig       | 2 +-
 configs/raspberrypi2_defconfig       | 2 +-
 configs/raspberrypi3_64_defconfig    | 2 +-
 configs/raspberrypi3_defconfig       | 2 +-
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 configs/raspberrypi_defconfig        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 63538c27f4..addf2d156f 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -10,7 +10,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dc3bd00d62130ef7f09759a8c0ec9d65f58c987"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index aca0ae0db8..130807b435 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dc3bd00d62130ef7f09759a8c0ec9d65f58c987"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index ac763c7b41..869e11c6bb 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dc3bd00d62130ef7f09759a8c0ec9d65f58c987"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 43f04517bb..8a7e193c68 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dc3bd00d62130ef7f09759a8c0ec9d65f58c987"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index eefaf5d55e..ca0e9ef6c2 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -13,7 +13,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dc3bd00d62130ef7f09759a8c0ec9d65f58c987"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index b2f9c3f4bb..6999b28266 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -12,7 +12,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7dc3bd00d62130ef7f09759a8c0ec9d65f58c987"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="240d0482ad9341f7d98b06705d0a55e298034121"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
-- 
2.15.0
