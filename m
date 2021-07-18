From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:35:46 +0200
Subject: [Buildroot] [git commit] configs/raspberrypicm4io_defconfig: fix
 typo (missing '=y')
Message-ID: <20210718200203.B2D4D8828D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=f64e93cd02ae3fc99918d619dd367f143389e29f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypicm4io_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index febaedd9e6..f4ba22dfe5 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -29,7 +29,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Required tool to flash CM4 eMMC memory
-BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
