From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 24 Jan 2020 12:57:36 +0100
Subject: [Buildroot] [PATCH v4 1/3] configs/raspberrypi*: bump kernel
 version to 64d0a98
Message-ID: <20200124115738.16642-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now based on 4.19.97 (from 4.19.75).

Go back to sha1 version scheme instead of official tag (after
only two tag versions) to get an up-to-date kernel version
(as the offical last tag is for 4.19.94).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes

Changes v2 -> v3:
  - bump version to 0d72d83/4.19.95
  - add sha1 explanation

Changes v3 -> v4:
  - bump version to 64d0a98/4.19.97
  - update change tag/sha1 reasoning
---
 configs/raspberrypi0_defconfig       | 2 +-
 configs/raspberrypi0w_defconfig      | 2 +-
 configs/raspberrypi2_defconfig       | 2 +-
 configs/raspberrypi3_64_defconfig    | 2 +-
 configs/raspberrypi3_defconfig       | 2 +-
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 configs/raspberrypi4_64_defconfig    | 2 +-
 configs/raspberrypi4_defconfig       | 2 +-
 configs/raspberrypi_defconfig        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 1600e219d1..38576dd65a 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index e3c747ff6f..f096f2bba4 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index e6c38e74b7..a91683292c 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index b9a070fb82..148769e9db 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 530eb0ab3f..6441fe57a9 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 4e9d782c7c..1e954011d5 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index f013c4382c..056b89cecd 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index a216463e28..70d6c4573e 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 969a92820e..2d662875d3 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190925-1)/linux-raspberrypi-kernel_1.20190925-1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,64d0a9870ac14d5eb5253f67d984ae348eec1393)/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
-- 
2.24.1
