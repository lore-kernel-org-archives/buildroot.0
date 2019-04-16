From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Apr 2019 22:39:25 +0200
Subject: [Buildroot] [git commit] configs/raspberrypi*: bump kernel version
 to 877656cd14
Message-ID: <20190416203728.B1E7A88F43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52ee3888c03d1cda38addc06baf311af71119684
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now based on 4.14.98 (from 4.14.95)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypi0_defconfig       | 2 +-
 configs/raspberrypi0w_defconfig      | 2 +-
 configs/raspberrypi2_defconfig       | 2 +-
 configs/raspberrypi3_64_defconfig    | 2 +-
 configs/raspberrypi3_defconfig       | 2 +-
 configs/raspberrypi3_qt5we_defconfig | 2 +-
 configs/raspberrypi_defconfig        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 2c8030d03d..c794a5753f 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 7149d91ba5..a7bda24275 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-0-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 343ae7b2fd..c4598e5f16 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 43687d29f1..8cc5bb60a7 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 9ad5b54b7c..41aa39a37d 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 276c7cd550..9fe4f9ad41 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 97573acafa..8b72d31369 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c)/linux-83b36f98e1a48d143f0b466fcf9f8c4e382c9a1c.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,877656cd145497db7c09a7de06ea85db98bd72a3)/linux-877656cd145497db7c09a7de06ea85db98bd72a3.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
