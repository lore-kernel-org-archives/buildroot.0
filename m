From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:31:22 +0100
Subject: [Buildroot] [git commit] configs/imx6ulevk: U-Boot needs host-dtc
Message-ID: <20180306143236.C24AE7FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9151fd0be5369302933c9f0f26f97008786552d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306824

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6ulevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index 0ae6b5308e..069f8cfc5e 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -25,6 +25,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
