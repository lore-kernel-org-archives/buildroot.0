From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 10:10:48 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: drop double linux
	tarball location
Message-ID: <20130411081134.EEF9D9A809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f43a9105dac6760ea1f6456e5cf29b956bc4fe7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Somehow the old setting wasn't dropped in 184850a42 (bump u-boot /
linux versions to current stable).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/nitrogen6x_defconfig |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 9828c8e..9b4d473 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -19,7 +19,6 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5f84e92/linux-imx6-5f84e92.tar.gz"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/2dc5560/linux-imx6-2dc5560.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
