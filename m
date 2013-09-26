From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 21:11:03 +0200
Subject: [Buildroot] [git commit] nitrogen6x: bump U-Boot to latest
	production version (2013.07)
Message-ID: <20130926193801.577589B88F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f368f2d19befa2adaa237a4e08d62a2ac3c92be6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/nitrogen6x_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index cdd8000..4c4bd1b 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_ROOTFS_EXT2_2r1=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/7176d07/u-boot-7176d07.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/4034391/u-boot-4034391.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
