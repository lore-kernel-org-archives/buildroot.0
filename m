From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  8 Jun 2021 21:47:21 +0200
Subject: [Buildroot] [PATCH v1 1/2] configs/raspberrypicm4io_defconfig: fix
 typo (missing '=y')
Message-ID: <20210608194722.13951-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 configs/raspberrypicm4io_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index cba07a9064..73dae90c3d 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -29,7 +29,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Required tool to flash CM4 eMMC memory
-BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.31.1
