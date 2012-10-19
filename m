From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Oct 2012 13:03:50 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: bump kernel version
Message-ID: <20121019125512.1FFDB99841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5435f00d7a8c2e76f59c72e943391cefb2de796
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To boundary-L3.0.35_12.09.01_GA branch.

See http://boundarydevices.com/october-freescale-releases-for-i-mx6/
for details.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/nitrogen6x_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 74b33c6..e3a78c7 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -19,6 +19,6 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-bo
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/cb1a536/linux-imx6-cb1a536.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/linux-imx6/tarball/5f84e92/linux-imx6-5f84e92.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
