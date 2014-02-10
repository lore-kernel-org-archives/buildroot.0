From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 19:42:50 +0100
Subject: [Buildroot] [git commit] beaglebone: update to latest U-Boot
Message-ID: <20140210184610.5FEF29C74E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c3144475e6e632d4504658075ed1f7120bacd9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the default version of U-Boot, at this time 2013.10.

Tested with an old uEnv.txt (i.e. using uImage) and with the
currently prefered zImage.

Signed-off-by: Anders Darander <anders@chargestorm.se>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index bd8f745..4e60e3f 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -22,7 +22,7 @@ BR2_DEFAULT_KERNEL_VERSION="3.12.10"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
