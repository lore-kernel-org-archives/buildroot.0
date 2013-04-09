From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 9 Apr 2013 16:36:21 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: bump u-boot / linux
	versions to current stable
Message-ID: <20130410095123.69B149B53E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=184850a4239c9677421ac6c6c4582b51a3caddd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described on http://boundarydevices.com/u-boot-branches-for-i-mx6-april-2013/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/nitrogen6x_defconfig |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index e3a78c7..9828c8e 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -12,13 +12,14 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabrelite"
+BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-2009-08/tarball/1f7edab/u-boot-1f7edab.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/7176d07/u-boot-7176d07.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5f84e92/linux-imx6-5f84e92.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/2dc5560/linux-imx6-2dc5560.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
