From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 24 Oct 2020 18:33:55 +0200
Subject: [Buildroot] [PATCH v1 1/2] configs/raspberrypi*: bump kernel
 version to ff93994 (5.4.72)
Message-ID: <20201024163356.17502-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now based on 5.4.72 (from 5.4.61)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
index d61eb4f1f1..930d7d9e50 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index bdee6575a0..08d6ec2e2b 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index af88da27ae..406e7c946e 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 1f3ca14d60..51bd88eed5 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index c2d08c81ff..cbe3daaf69 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 06a9a87ce1..222d299525 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 0e17d3de4d..b80cf41173 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 230d0a982a..b652c7b10c 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index ae7eb10321..edff12dd4c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9a1dd17906692f1ab76e45b9f59976b063b37034)/linux-9a1dd17906692f1ab76e45b9f59976b063b37034.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
-- 
2.28.0
