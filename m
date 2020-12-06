From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  6 Dec 2020 12:42:44 +0100
Subject: [Buildroot] [PATCH v1 1/5] configs/raspberrypi*: bump kernel
 version to f4b5d0d (5.4.80)
In-Reply-To: <20201206114248.24700-1-ps.report@gmx.net>
References: <20201206114248.24700-1-ps.report@gmx.net>
Message-ID: <20201206114248.24700-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now based on 5.4.80 (from 5.4.72).

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
index 930d7d9e50..3b2178c3cb 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 08d6ec2e2b..2f2dafbedd 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 406e7c946e..431e194c02 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 51bd88eed5..e71602f760 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index cbe3daaf69..faa93920e9 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 222d299525..8c54e70bbd 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index b80cf41173..c344d88e0d 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index b652c7b10c..76e4f99cb6 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index edff12dd4c..59af19fa1d 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ff93994fb3f92070d8521d709ad04675ecaa5817)/linux-ff93994fb3f92070d8521d709ad04675ecaa5817.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6)/linux-f4b5d0de4ffad239ed01ce08d49d4f7eeeccb1a6.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
-- 
2.29.2
