From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 01:09:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/rpi-firmware: bump version
In-Reply-To: <cover.1384128473.git.yann.morin.1998@free.fr>
References: <cover.1384128473.git.yann.morin.1998@free.fr>
Message-ID: <83328584376308e4a8a1b9bf4768599c690ecbff.1384128473.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump bootloader and GPU firmware for misc fixes:
  - cec fixes
  - DTS buffering
  - others (pause_burst_frames enabled by default. WTF is that?)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Since these are binary blobs, we can only rely on the commit log in
the upstream git tree to see what was fixed. So, we are completely
blind as to what actuallt changed... :-/
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index e6763af..94badf9 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 5343d029a5f2f09bd9801914eac0d4bf95cadc1f
+RPI_FIRMWARE_VERSION = 18a163f9341755b00841312af2878afeb64c131c
 RPI_FIRMWARE_SITE = http://github.com/raspberrypi/firmware/tarball/$(RPI_FIRMWARE_VERSION)
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
1.8.1.2
