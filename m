From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Nov 2013 19:28:03 +0100
Subject: [Buildroot] [PATCH 1/4] package/rpi-firmware: bump
In-Reply-To: <cover.1383675996.git.yann.morin.1998@free.fr>
References: <cover.1383675996.git.yann.morin.1998@free.fr>
Message-ID: <adecc0f0703ed14aa2fe65c3d2c37a15dbaeccce.1383675996.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Further fixes for de-interlacing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index a7574f2..e6763af 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 58036da500d936a98156d703fa220dc7db175762
+RPI_FIRMWARE_VERSION = 5343d029a5f2f09bd9801914eac0d4bf95cadc1f
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
