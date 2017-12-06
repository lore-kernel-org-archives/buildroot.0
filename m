From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 21:37:09 +0100
Subject: [Buildroot] [git commit] configs/raspberrypi*: bump kernel version
Message-ID: <20171206202952.F29DA827D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f010313e24d2e136d121fbd047f1e77c94cadc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now based on 4.9.66 (from 4.9.52).

Signed-off-by: Mario Lang <mlang@blind.guru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi0_defconfig       | 2 +-
 configs/raspberrypi2_defconfig       | 2 +-
 configs/raspberrypi3_64_defconfig    | 2 +-
 configs/raspberrypi3_defconfig       | 2 +-
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 configs/raspberrypi_defconfig        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 63538c2..addf2d1 100644
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
index aca0ae0..130807b 100644
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
index ac763c7..869e11c 100644
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
index 43f0451..8a7e193 100644
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
index eefaf5d..ca0e9ef 100644
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
index b2f9c3f..6999b28 100644
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
