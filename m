From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Sep 2013 21:13:21 +0200
Subject: [Buildroot] [git commit] nitrogen6x: u-boot: use imx format to
	match bootscript
Message-ID: <20130926193801.734C09B7B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=844c52ecd4df1d49a0b8eda54f3e204ee0e9f158
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/nitrogen6x_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 4c4bd1b..5f39f8d 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_ROOTFS_EXT2_2r1=y
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/4034391/u-boot-4034391.tar.gz"
 
