From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 15:17:58 +0200
Subject: [Buildroot] [git commit] configs/nitrogen*: bump kernel and u-boot
	revisions
Message-ID: <20170722131401.EAC177FBE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0401a61eb6e94453fcc8156a8b78ed233cadcf07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Here are the main U-Boot modifications:
- Rebase on top of mainline 2017.03 release
- Fix sparse image flashing issues

Here are the main Linux modifications:
- Add mma8451 driver support
- Fix possible TiWi spurious interrupts issue
- Fix Ethernet interrupt parent issue
- Add USB Type C TUSB320 controller support
- Add SOM2 i.MX6DL and i.MX6QP variants

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/nitrogen6sx_defconfig | 6 +++---
 configs/nitrogen6x_defconfig  | 8 ++++----
 configs/nitrogen7_defconfig   | 6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index 6bb9953..fc568fb 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -25,14 +25,14 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6sx"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/9cbdb79a.tar.gz"
+# Last version of branch boundary-v2017.03
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/4280a700.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_4.1.15_2.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/3c1c6149.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8b305512.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 48bb114..43ff708 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -25,15 +25,15 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/9cbdb79a.tar.gz"
+# Last version of branch boundary-v2017.03
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/4280a700.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_4.1.15_2.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/3c1c6149.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8b305512.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6q-nitrogen6_som2 imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_vm imx6dl-nitrogen6x imx6q-nitrogen6x imx6dl-nitrogen6_som2 imx6q-nitrogen6_som2 imx6qp-nitrogen6_som2 imx6q-nitrogen6_max imx6qp-nitrogen6_max imx6q-sabrelite"
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index b027fb7..da5938b 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -24,14 +24,14 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen7"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-# Last version of branch boundary-v2016.03
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/9cbdb79a.tar.gz"
+# Last version of branch boundary-v2017.03
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/u-boot-imx6/archive/4280a700.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 # Last version of branch boundary-imx_4.1.15_2.0.0_ga
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/3c1c6149.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/linux-imx6/archive/8b305512.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="boundary"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
