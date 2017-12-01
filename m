From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:59:43 +0100
Subject: [Buildroot] [git commit] armbian-firmware: fix check-package
 warnings
Message-ID: <20171201215250.1604C80F6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d55a3eb0e1b431cf495aa67bbd6aa7fee0697f10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

./package/armbian-firmware/armbian-firmware.mk:14: use only one space before backslash
./package/armbian-firmware/armbian-firmware.mk:15: use only one space before backslash

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/armbian-firmware/armbian-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armbian-firmware/armbian-firmware.mk b/package/armbian-firmware/armbian-firmware.mk
index e77d516..48b0372 100644
--- a/package/armbian-firmware/armbian-firmware.mk
+++ b/package/armbian-firmware/armbian-firmware.mk
@@ -11,8 +11,8 @@ ARMBIAN_FIRMWARE_SITE_METHOD = git
 # XR819 WiFi firmware
 ifeq ($(BR2_PACKAGE_ARMBIAN_FIRMWARE_XR819),y)
 ARMBIAN_FIRMWARE_FILES += \
-	xr819/boot_xr819.bin  \
-	xr819/fw_xr819.bin  \
+	xr819/boot_xr819.bin \
+	xr819/fw_xr819.bin \
 	xr819/sdd_xr819.bin
 endif
 
