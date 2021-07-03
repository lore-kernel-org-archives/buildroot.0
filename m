From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  3 Jul 2021 23:13:11 +0200
Subject: [Buildroot] [PATCH v1 1/3] configs/raspberrypi*: bump kernel
 version to 4afd064 (5.10.46)
Message-ID: <20210703211313.19364-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now based on 5.10.46 (from 5.10.36)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 configs/raspberrypi0_defconfig        | 2 +-
 configs/raspberrypi0w_defconfig       | 2 +-
 configs/raspberrypi2_defconfig        | 2 +-
 configs/raspberrypi3_64_defconfig     | 2 +-
 configs/raspberrypi3_defconfig        | 2 +-
 configs/raspberrypi3_qt5we_defconfig  | 2 +-
 configs/raspberrypi4_64_defconfig     | 2 +-
 configs/raspberrypi4_defconfig        | 2 +-
 configs/raspberrypi_defconfig         | 2 +-
 configs/raspberrypicm4io_64_defconfig | 2 +-
 configs/raspberrypicm4io_defconfig    | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 5ca003cbec..c17fe99c45 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index bced6c5d4a..3a5e306299 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 47807688da..1eee3ae37e 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 3be53b6c8d..859d95314c 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 74f5a23682..67ce0d5314 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 1e9061435c..d9538dc648 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 16777bcef1..312ec64471 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 139bed0c3f..3ae2d253fb 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index de1248f36b..75e7177974 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 66a9332fe5..62512ad7c5 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index cba07a9064..febaedd9e6 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,b657cd2f27d9171b75c846f21e7b4bb581b3ed29)/linux-b657cd2f27d9171b75c846f21e7b4bb581b3ed29.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,4afd064509b23882268922824edc5b391a1ea55d)/linux-4afd064509b23882268922824edc5b391a1ea55d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
-- 
2.32.0
