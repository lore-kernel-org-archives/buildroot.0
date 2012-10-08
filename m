From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Oct 2012 21:29:23 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: Use tarball from
	github instead of cloning git
Message-ID: <20121008193021.6A905997E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f85b682a52a01c25b8cc3f4f1b13cc3e6a43cfa1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/nitrogen6x_defconfig |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 2b7daec..74b33c6 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -13,14 +13,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabrelite"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://github.com/boundarydevices/u-boot-2009-08.git"
-BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="1f7edab0ac5ebf564e9ad9797fedc2a668149b96"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-2009-08/tarball/1f7edab/u-boot-1f7edab.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/boundarydevices/linux-imx6.git"
-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="cb1a536f4583af7e1572d39cabd4ac597a8916a5"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/cb1a536/linux-imx6-cb1a536.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
