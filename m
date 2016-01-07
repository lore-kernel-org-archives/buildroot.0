From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 17:07:05 -0300
Subject: [Buildroot] [PATCH 2/3] rpi-firmware: version bump
In-Reply-To: <1452197226-15625-1-git-send-email-gustavo@zacarias.com.ar>
References: <1452197226-15625-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1452197226-15625-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To match the previous kernel version bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rpi-firmware/rpi-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2436376..4b92a50 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 52f65ac4ad1ef1d2838fa2f921d5bc3ece4c777b
+RPI_FIRMWARE_VERSION = 22d8c910f4c53118f9cf85c038d7d8e307efc110
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.4.10
