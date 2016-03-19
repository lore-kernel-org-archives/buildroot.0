From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:59:16 +0100
Subject: [Buildroot] [git commit] configs: nitrogen*: bump kernel version to
	3.14.52-1.1.0_ga
Message-ID: <20160319135921.9009580395@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78588a6395d4ab0770b174c5e3db910b1b928016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add device tree of our Nitrogen6_Max QuadPlus version:
https://boundarydevices.com/product/nitrogen6max/

As well as our latest SOM version:
https://boundarydevices.com/product/nit6x-som-v2/

Using the latest commit of our 3.14.52 kernel branch:
https://github.com/boundarydevices/linux-imx6/commits/boundary-imx_3.14.52_1.1.0_ga

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nitrogen6sx_defconfig | 4 ++--
 configs/nitrogen6x_defconfig  | 6 +++---
 configs/nitrogen7_defconfig   | 3 ++-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index fcc74c9..161130e 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -28,8 +28,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_3.14.28_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/f4c8395/linux-imx6-f4c8395.tar.gz"
+# Last version of branch boundary-imx_3.14.52_1.1.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 7b95988..be8877f 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -28,10 +28,10 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-# Last version of branch boundary-imx_3.14.28_1.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/f4c8395/linux-imx6-f4c8395.tar.gz"
+# Last version of branch boundary-imx_3.14.52_1.1.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_max imx6q-sabrelite"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_som2 imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index d8c3975..3761845 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -28,7 +28,8 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/20cee23/linux-imx6-20cee23.tar.gz"
+# Last version of branch boundary-imx_3.14.52_1.1.0_ga
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/tarball/0d92195d/linux-imx6-0d92195d.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
