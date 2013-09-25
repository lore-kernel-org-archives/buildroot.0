From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Wed, 25 Sep 2013 12:07:49 -0700
Subject: [Buildroot] [PATCH 1/4] nitrogen6x: bump U-Boot to latest
	production version (2013.07)
In-Reply-To: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
References: <1380136072-9879-1-git-send-email-eric.nelson@boundarydevices.com>
Message-ID: <1380136072-9879-2-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
---
 configs/nitrogen6x_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.2
